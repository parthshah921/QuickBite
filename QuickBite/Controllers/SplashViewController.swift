//
//  SplashViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-02.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var gettingStartedCardView: CardView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
//
//                let isUserLoggedIn = CommonFunctions.getSession()
//                if isUserLoggedIn
//                {
//                    self.performSegue(withIdentifier: "homeSegue", sender: self)
//                }else
//                {
//                self.performSegue(withIdentifier: "loginSegue", sender: self)
//                 }
            
         
        
                    
//    })
        
        let gettingStatedPress = UITapGestureRecognizer(target: self, action: #selector(gettingStatedPressed(tapGestureRecognizer:)))
       gettingStartedCardView.isUserInteractionEnabled = true
        gettingStartedCardView.addGestureRecognizer(gettingStatedPress)
        
   
    }
    
    @objc func gettingStatedPressed(tapGestureRecognizer : UITapGestureRecognizer)
    {
        let isUserLoggedIn = CommonFunctions.getSession()
        if isUserLoggedIn
        {
            self.performSegue(withIdentifier: "homeSegue", sender: self)
        }else
        {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
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
