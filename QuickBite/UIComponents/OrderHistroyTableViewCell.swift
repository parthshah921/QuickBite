//
//  OrderHistroyTableViewCell.swift
//  FinalProject
//
//  Created by Saeed on 2023-12-04.
//

import UIKit

class OrderHistroyTableViewCell: UITableViewCell {


    @IBOutlet var orderId: UILabel!
    @IBOutlet var cardView: CardView!
    @IBOutlet var restaueantName: UILabel!
    @IBOutlet var reOrderButton: UIButton!
    @IBOutlet var restaurantImg: UIImageView!
    @IBOutlet var detailsButton: UIButton!
    @IBOutlet var totalPrice: UILabel!
    @IBOutlet var detail2Button: UIButton!
    
    @IBAction func detailsButtonPre(_ sender: Any) {
        print("Abc")
     
        
        
    }
    @IBOutlet var detailsButtonPresed: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
