import UIKit
import CoreData


struct Profile {
    var fullName: String
    var email: String
    var location: String
}
class ProfileViewController: UIViewController {

    @IBOutlet weak var profileCard: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var profileFullName: UILabel!
    
    @IBOutlet weak var profileAddress: UILabel!
    @IBOutlet weak var profileImageCard: UIImageView!
    @IBOutlet weak var profileEmail: UILabel!
    
    var user = NSManagedObject()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add corner radius and shadow to the profileCard
        profileCard.layer.cornerRadius = 10.0
        profileCard.layer.shadowColor = UIColor.black.cgColor
        profileCard.layer.shadowOpacity = 0.5
        profileCard.layer.shadowOffset = CGSize(width: 0, height: 2)
        profileCard.layer.shadowRadius = 4.0
        profileCard.layer.masksToBounds = false
        
        
        // Add the following code to make it round
        profileImageCard.layer.cornerRadius = profileImageCard.frame.size.width / 2
        profileImageCard.layer.shadowColor = UIColor.black.cgColor
        profileImageCard.layer.shadowOpacity = 0.5
        profileImageCard.layer.shadowOffset = CGSize(width: 0, height: 2)
        profileImageCard.layer.shadowRadius = 4.0
        
        
        
     fetchData()
        
        
      

         
      
     
    }
    
    @objc func showDeleteAccountDialog() {
        let alertController = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            // Perform the delete account operation here
            self.deleteAccount()
        }
        alertController.addAction(deleteAction)

        present(alertController, animated: true, completion: nil)
    }

    func deleteAccount() {
        CommonFunctions.removeSession()
        // Add your code to handle the deletion of the account
        // This is where you would typically make API calls, update the database, etc.
        print("Account deleted successfully.")
    }
    
    @IBAction func deleteAccountTapped(_ sender: Any) {
        
        showDeleteAccountDialog()
    }
    
    
    
    
   
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext

               // Specify the entity to fetch
               let fetchRequest = NSFetchRequest<UserInfo>(entityName: "UserInfo")

               do {
                   // Perform the fetch
                   let userInfoArray = try context.fetch(fetchRequest)

                   // Assuming there is only one UserInfo object
                   if let userInfo = userInfoArray.first {
                       // Update UI with fetched data
                       profileFullName.text = userInfo.name
                       profileEmail.text = userInfo.email
                       locationLabel.text = "Toronto,Canada"
                       profileAddress.text = userInfo.contactNo
                   } else {
                       // Handle the case when there is no UserInfo data
                       print("No UserInfo data found.")
                   }
               } catch {
                   print("Failed to fetch UserInfo data: \(error)")
               }
    }
  
    @IBAction func offersButtonTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "offerSegue", sender:nil)
    }
    
    
    
    @IBAction func paymentButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "paymentSegue", sender:nil)
    }
    
    @IBAction func sendFeedbackTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "contactUsSegue", sender:nil)
    }
    
    func showLogoutAlert() {
           let alert = UIAlertController(
               title: "Logout",
               message: "Are you sure you want to logout?",
               preferredStyle: .alert
           )

           // Add a "Cancel" action
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

           // Add a "Logout" action
           alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { _ in
               // Perform logout actions here
               self.logout()
           })

           // Present the alert
           present(alert, animated: true, completion: nil)
       }

       // Function to perform actual logout actions
       func logout() {
           CommonFunctions.removeSession()
           self.navigationController?.popToRootViewController(animated: true)
       }

       // Action triggered when the user taps a logout button, for example
       @IBAction func logoutButtonTapped(_ sender: UIButton) {
           showLogoutAlert()
       }
    
    
    // MARK: - CLLocationManagerDelegate

}
