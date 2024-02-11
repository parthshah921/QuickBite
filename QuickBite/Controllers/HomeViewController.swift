//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-03.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet var notificationImg: UIImageView!
    @IBOutlet var cartImg: UIImageView!
    @IBOutlet var seeAllLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.searchTextField.delegate = self
        
        tableView.tableFooterView = UIView()
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        let cartButtonPress = UITapGestureRecognizer(target: self, action: #selector(cartButtonTapped(tapGestureRecognizer:)))
        cartImg.isUserInteractionEnabled = true
        cartImg.addGestureRecognizer(cartButtonPress)
        
        let notificationButtonPress = UITapGestureRecognizer(target: self, action: #selector(notificationButtonTapped(tapGestureRecognizer:)))
        notificationImg.isUserInteractionEnabled = true
        notificationImg.addGestureRecognizer(notificationButtonPress)
        
        let seeAllButtonPress = UITapGestureRecognizer(target: self, action: #selector(seeAllButtonTapped(tapGestureRecognizer:)))
        seeAllLabel.isUserInteractionEnabled = true
        seeAllLabel.addGestureRecognizer(seeAllButtonPress)
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
       
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
       
   let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
           
   cell.selectionStyle = .none
   tableView.separatorStyle = .none
   
      
       if(indexPath.row == 1)
       {
           
           cell.restaurantImg.image = UIImage(named: "sample_food3")
           cell.restaurantLabel.text = "Teriyaki"
       }
       else if(indexPath.row == 2)
       {
           
           cell.restaurantImg.image = UIImage(named: "Sample_food2")
           cell.restaurantLabel.text = "Quessadila"
       }
          
           
           return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0)
        {
            selectedCategory = "Pizzas"
        }else if(indexPath.row == 1)
        {
            selectedCategory = "Teriyaki"
        }else{
            selectedCategory = "Quesadilla"
        }
        self.performSegue(withIdentifier: "menuSegue", sender: self)
    }
    
    
    
    @objc func notificationButtonTapped(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "notificationSegue", sender: self)
    }
    
    @objc func seeAllButtonTapped(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "offerSegue", sender: self)
    }
    

    
    @objc func cartButtonTapped(tapGestureRecognizer : UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "cartSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "menuSegue")
        {
            
            if let menuVC = segue.destination as? MenuViewController {
                      // Pass the data to the "Add New Event" view controller
                menuVC.selectedCategory = self.selectedCategory
                  }
            
        
        }
    }
    
    


}


