//
//  LoginWithOTPViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-02.
//

import UIKit

class LoginWithOTPViewController: UIViewController {

    @IBOutlet weak var loginWithOtpTextField: UITextField!
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var exploreLabel: UILabel!
    @IBOutlet weak var signInCardView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginWithOtpTextField.delegate = self

        // Do any additional setup after loading the view.
        
        let exploreLabelPress = UITapGestureRecognizer(target: self, action: #selector(exploreButtonPressed(tapGestureRecognizer:)))
        exploreLabel.isUserInteractionEnabled = true
        exploreLabel.addGestureRecognizer(exploreLabelPress)
        
        let signUpLabelPress = UITapGestureRecognizer(target: self, action: #selector(signUpPressed(tapGestureRecognizer:)))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(signUpLabelPress)
        
        let signInWithOtpPress = UITapGestureRecognizer(target: self, action: #selector(signInPressed(tapGestureRecognizer:)))
        signInCardView.isUserInteractionEnabled = true
        signInCardView.addGestureRecognizer(signInWithOtpPress)
    }
    
    @objc func signInPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "otpSegue", sender: self)
    }
    
    @objc func exploreButtonPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    @objc func signUpPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        CommonFunctions.setSession()
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginWithOTPViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
   }
}

