import Foundation
import UIKit
@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var topRight: Bool = true
    @IBInspectable var topLeft: Bool = true
    @IBInspectable var bottomRight: Bool = true
    @IBInspectable var bottomLeft: Bool = true
    
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var borderColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        
      
        
        var roundedCorners: UIRectCorner = []
        if(topRight){ roundedCorners.insert(.topRight)}
        if(topLeft){ roundedCorners.insert(.topLeft)}
         if(bottomRight){ roundedCorners.insert(.bottomRight)}
         if(bottomLeft){ roundedCorners.insert(.bottomLeft)}
       
        let shadowPath = UIBezierPath(roundedRect:bounds,
                                      byRoundingCorners: roundedCorners,
                                   cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        if (topRight && topLeft && bottomRight && bottomLeft){
             layer.cornerRadius = cornerRadius
        } else {
            roundCorners(corners: roundedCorners, radius: cornerRadius)
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    
}
