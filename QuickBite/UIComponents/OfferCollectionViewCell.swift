//
//  OfferCollectionViewCell.swift
//  QuickBite
//
//  Created by Parth Shah on 2023-12-10.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell
{
       @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
        @IBOutlet weak var offerImageView: UIImageView!
        // Add other UI elements as needed
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
      
        // Initialization code
    }
    
    static var nib:UINib {
           return UINib(nibName: identifier, bundle: nil)
       }
                                                 
       static var identifier: String {
           return String(describing: self)
       }

}
