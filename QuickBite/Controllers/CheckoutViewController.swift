//
//  CheckoutViewController.swift
//  QuickBite
//
//  Created by Parth Shah on 2023-12-10.
//

import UIKit

class CheckoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkOutButtonTapped(_ sender: Any) {
        
        if(CommonFunctions.getSession()){
            self.performSegue(withIdentifier: "paymentSegue", sender: nil)
        }else{
            showToast(message: "Please Login First")
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
