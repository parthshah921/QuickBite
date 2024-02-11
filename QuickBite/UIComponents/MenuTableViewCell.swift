//
//  MenuTableViewCell.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-03.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var minusImg: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusImg: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
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
