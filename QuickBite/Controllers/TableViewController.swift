//
//  TableViewController.swift
//  FinalProject
//
//  Created by Shampreet Singh on 2023-12-04.
//

import UIKit

class TableViewController: UITableViewController {
    
    let restaurantName = ["Street Cafe","Dessert Spot"]

    let cartItems = ["The signature burger","Chocolate Chip Waffle"]
    
    let info = ["1 item | 0.6 km","2 items | 1.2 km"]
    
    let images = ["burger","waffle"]
    
    let price = ["$8.99","$11.99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  cartItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        if let customLabel = cell.viewWithTag(1) as? UILabel {
            
                customLabel.text = restaurantName[indexPath.row]
        }
        
        if let customLabel = cell.viewWithTag(2) as? UILabel {
            
                customLabel.text = cartItems[indexPath.row]
        }
        
        if let customLabel = cell.viewWithTag(3) as? UILabel {
            
                customLabel.text = info[indexPath.row]
        }
        
        if let customLabel = cell.viewWithTag(4) as? UILabel {
            
                customLabel.text = price[indexPath.row]
        }
        
        if let imageView = cell.viewWithTag(5) as? UIImageView {
               imageView.image = UIImage(named: images[indexPath.row])

               let width: CGFloat = 200.0
               let height: CGFloat = 150.0
               imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
           }

        return cell
    }


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
