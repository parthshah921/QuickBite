//
//  LoginWithSocialViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-02.
//

import UIKit

class LoginWithSocialViewController: UIViewController {

    @IBOutlet weak var loginWithFacebookCardView: CardView!
    @IBOutlet weak var loginWithGoogle: CardView!
    @IBOutlet weak var loginWithApple: CardView!
    @IBOutlet weak var signinWithOtpCardView: CardView!
    @IBOutlet weak var signUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginWithFacebookCardView.layer.borderColor = UIColor(hexString: "#E5D9D9").cgColor
        loginWithGoogle.layer.borderColor = UIColor(hexString: "#E5D9D9").cgColor
        loginWithApple.layer.borderColor = UIColor(hexString: "#E5D9D9").cgColor
        // Do any additional setup after loading the view.
        
        
        let signUpLabelPress = UITapGestureRecognizer(target: self, action: #selector(signUpPressed(tapGestureRecognizer:)))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(signUpLabelPress)
        
        let signInWithOtpPress = UITapGestureRecognizer(target: self, action: #selector(signInWithOtpPressed(tapGestureRecognizer:)))
        signinWithOtpCardView.isUserInteractionEnabled = true
        signinWithOtpCardView.addGestureRecognizer(signInWithOtpPress)
    }
    
    @objc func signUpPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        CommonFunctions.setSession()
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    
    @objc func signInWithOtpPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "loginWithOtpSegue", sender: self)
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
