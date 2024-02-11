//
//  OtpViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-03.
//

import UIKit

class OtpViewController: UIViewController {

    @IBOutlet weak var codeSendLabel: UILabel!
    @IBOutlet weak var resendCodeLabel: UILabel!
    @IBOutlet weak var verifyCardView: CardView!
   
    @IBOutlet weak var firstTextField: SingleDigitField!
    @IBOutlet weak var secondTextField: SingleDigitField!
    
    @IBOutlet weak var thirdTextField: SingleDigitField!
    
    @IBOutlet weak var fourthTextField: SingleDigitField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [firstTextField, secondTextField, thirdTextField, fourthTextField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        firstTextField.isUserInteractionEnabled = true
        firstTextField.becomeFirstResponder()
        
        self.navigationItem.title = "OTP Code Vertification"
        // Do any additional setup after loading the view.
        
        
        let verifyPress = UITapGestureRecognizer(target: self, action: #selector(verifyPressed(tapGestureRecognizer:)))
        verifyCardView.isUserInteractionEnabled = true
        verifyCardView.addGestureRecognizer(verifyPress)
    }
    
    @objc func verifyPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        CommonFunctions.setSession()
        self.performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    
    
    
    @objc func editingChanged(_ textField: SingleDigitField) {
        if textField.pressedDelete {
            textField.pressedDelete = false
            if textField.hasText {
                textField.text = ""
            } else {
                switch textField {
                case secondTextField, thirdTextField, fourthTextField:
                    textField.resignFirstResponder()
                    textField.isUserInteractionEnabled = false
                    switch textField {
                    case secondTextField:
                        firstTextField.isUserInteractionEnabled = true
                        firstTextField.becomeFirstResponder()
                        firstTextField.text = ""
                    case thirdTextField:
                        secondTextField.isUserInteractionEnabled = true
                        secondTextField.becomeFirstResponder()
                        secondTextField.text = ""
                    case fourthTextField:
                        thirdTextField.isUserInteractionEnabled = true
                        thirdTextField.becomeFirstResponder()
                        thirdTextField.text = ""
                    default:
                        break
                    }
                default: break
                }
            }
        }

        guard textField.text?.count == 1, textField.text?.last?.isWholeNumber == true else {
            textField.text = ""
            return
        }
        switch textField {
        case firstTextField, secondTextField, thirdTextField:
            textField.resignFirstResponder()
            textField.isUserInteractionEnabled = false
            switch textField {
            case firstTextField:
                secondTextField.isUserInteractionEnabled = true
                secondTextField.becomeFirstResponder()
            case secondTextField:
                thirdTextField.isUserInteractionEnabled = true
                thirdTextField.becomeFirstResponder()
            case thirdTextField:
                fourthTextField.isUserInteractionEnabled = true
                fourthTextField.becomeFirstResponder()
            default: break
            }
        case fourthTextField:
            fourthTextField.resignFirstResponder()
        default: break
        }
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
