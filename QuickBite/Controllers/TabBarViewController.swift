//
//  TabBarViewController.swift
//  FinalProject
//
//  Created by Parth Shah on 2023-12-03.
//

import UIKit

class TabBarViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        self.navigationController?.viewControllers = [self]
        setUI()
         
        
    }
    
    
   
    
    func setUI()
    {
        
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: (tabBar.frame.width / numberOfItems), height: tabBar.frame.height )
       
       
        tabBar.frame.size.width = self.view.frame.width
        tabBar.frame.origin.x = -5
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tabBar.layer.borderColor = UIColor.white.cgColor
  
        
    }

    

}
extension UIImage
{
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        color.setFill()
        UIRectFill(rect)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        image = image.withRoundedCorners(radius: 12,size: size)!
        UIGraphicsEndImageContext()
        return image
    }
    
    public func withRoundedCorners(radius: CGFloat? = nil,size: CGSize) -> UIImage? {
          
              UIGraphicsBeginImageContextWithOptions(size, false, 0)
              let rect : CGRect = CGRect(x: 10, y: 0, width: 80 , height: 50)
        UIBezierPath(roundedRect: rect,byRoundingCorners : [.topLeft,.topRight,.bottomLeft,.bottomRight] ,cornerRadii: CGSize(width: 10, height: 10)).addClip()
              draw(in: rect)
              let image = UIGraphicsGetImageFromCurrentImageContext()
              UIGraphicsEndImageContext()
              return image
          }
}
