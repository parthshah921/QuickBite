//
//  SignupViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-02.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpCardView: CardView!
    @IBOutlet weak var fullNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        fullNameTextField.delegate = self

        // Do any additional setup after loading the view.
        
        let verifyPress = UITapGestureRecognizer(target: self, action: #selector(signUpPressed(tapGestureRecognizer:)))
        signUpCardView.isUserInteractionEnabled = true
        signUpCardView.addGestureRecognizer(verifyPress)
    }
    
    @objc func signUpPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        CommonFunctions.setSession()
        saveData()
        self.performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    func saveData()
    {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)!
            
            let user = NSManagedObject(entity: entity, insertInto: managedContext)
            
        user.setValue(phoneNumberTextField.text, forKey: "contactNo")
        user.setValue(emailTextField.text, forKey: "email")
        user.setValue(fullNameTextField.text, forKey: "name")
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
            
            do {
                try managedContext.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        
    }
    
    
    

    

}

extension SignupViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
   }
}
