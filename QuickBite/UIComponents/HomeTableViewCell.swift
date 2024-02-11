//
//  HomeTableViewCell.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-03.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantImg.layer.cornerRadius = 20
        cardView.layer.borderColor = UIColor.systemGray6.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib:UINib {
           return UINib(nibName: identifier, bundle: nil)
       }
                                                 
       static var identifier: String {
           return String(describing: self)
       }
    
}
