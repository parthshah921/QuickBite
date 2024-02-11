import Foundation
import UIKit
 class AppColors
{
    static let themeColor = "#175B72"
    static let buttonColor = "#9e1f21"
    static let textColor = "#58585b"
    static let whiteColor = "#FFFFFF"
    static let tableColor = "#EEEEEE"
    
    static let baseColorBeforeLogin = "FF0000"
    static let baseColorAfterLogin = "A5302A"
    
  //  static let themeStartColor = UIColor(hexString: "#FBD3E9")
   // static let themeEndColor =   UIColor(hexString: "#BB377D")
    
    static let themeStartColor = UIColor(hexString: "#9CECFB")
     static let themeEndColor =   UIColor(hexString: "#0052D4")
    
    
    
   // static let themeStartColor = UIColor(hexString: "#ec008c")
   // static let themeEndColor =   UIColor(hexString: "#fc6767")
    
   // static let themeStartColor = UIColor(hexString: "#bc4e9c")
   // static let themeEndColor =   UIColor(hexString: "#f80759")
    
    
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 5.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
