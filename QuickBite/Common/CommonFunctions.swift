import Foundation
import UIKit
import QuickLook

class CommonFunctions
{
    
    
    class func setSession(){
        
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: AppConstants.isUserLoggedIn)
        defaults.synchronize()
        
    }
    
    class func getSession()-> Bool
    {
        let defaults = UserDefaults.standard
        var value = false
        if defaults.value(forKey: AppConstants.isUserLoggedIn) != nil
        {
            value = defaults.value(forKey: AppConstants.isUserLoggedIn) as! Bool
        }
        
        return value
        
    }
    
    class func removeSession()
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: AppConstants.isUserLoggedIn)
        defaults.removeObject(forKey: AppConstants.userEmail)
        defaults.synchronize()
        
    }
    
    
    
    class func uicolorFromHex (hex:String) -> UIColor {
           var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
           
           if (cString.hasPrefix("#")) {
               cString.remove(at: cString.startIndex)
           }
           
           // if ((cString.characters.count) != 6) {
           if ((cString.count) != 6) {
               return UIColor.white
           }
           
           var rgbValue:UInt32 = 0
           Scanner(string: cString).scanHexInt32(&rgbValue)
           
           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
    
    class func saveUserEmail(value : String){
        
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: AppConstants.userEmail)
        defaults.synchronize()
        
    }
    
    class func getSavedUserEmail()->String
    {
        
        let defaults = UserDefaults.standard
        var value = ""
        if defaults.value(forKey: AppConstants.userEmail) != nil
        {
            value = defaults.value(forKey: AppConstants.userEmail) as! String
        }
        
        return value
    }
    
    
    class func saveUserKey(value : String)
    {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: AppConstants.prefUserKey)
        defaults.synchronize()
        
    }
    
    class func getSavedUserKey()->String
    {
        
        let defaults = UserDefaults.standard
        var value = ""
        if defaults.value(forKey: AppConstants.prefUserKey) != nil
        {
            value = defaults.value(forKey: AppConstants.prefUserKey) as! String
        }
        
        return value
    }
    
    class func saveUserName(value : String)
    {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: AppConstants.userrName)
        defaults.synchronize()
        
    }
    
    class func getSavedUserName()->String
    {
        let defaults = UserDefaults.standard
        var value = ""
        if defaults.value(forKey: AppConstants.userrName) != nil
        {
            value = defaults.value(forKey: AppConstants.userrName) as! String
        }
        
        return value
    }
    
  
    
    class func dateFormat(value : Double) -> String
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.dateFormatForDisplay
        //   let timeInterval = Double(vitalsDate)
        let dateForm = Date(timeIntervalSince1970: value)
        let date = inputFormatter.string(from: dateForm)
        return date
        
    }
    
    class func dateFromString(value : String) -> Double
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.dateFormatForDisplay
        let date = inputFormatter.date(from: value)

        let timeInterval = date!.timeIntervalSince1970
        let dateInDouble = Double(timeInterval)
        return dateInDouble
    }
    
    class func timeFromString(value : String) -> Double
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.timeFormat
        let time = inputFormatter.date(from: value)
        let timeInterval = time!.timeIntervalSince1970
        let timeInDouble = Double(timeInterval)
        return timeInDouble
    }
    
    class func getCurrentTimeStamp() -> String {
        let date = Date()
        let currentMillis = date.millisecondsSince1970
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmms"
        
        dateFormatter.timeZone = TimeZone(abbreviation: "localTimeZone")
        _ = dateFormatter.string(from: date as Date)
        return String(currentMillis)
    }
    
    class func getCurrentMillis() -> Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
    
    class func getDateFromMillis(timeInterval: Int) -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval/1000))
        return date
    }
    
    class func timeFormatFromDate(value: Date)-> String
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.timeFormat
        let time = inputFormatter.string(from: value)
        return time
        
    }
    
    class func dateFormatFromDate(value: Date)-> String
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.dateFormatForDisplay
        
        let date = inputFormatter.string(from: value)
        return date
        
    }
    
    class func timeFormat(value : Double) -> String
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.timeFormat
        let timeForm = Date(timeIntervalSince1970: value)
        let time = inputFormatter.string(from: timeForm)
        return time
    }
    
    class func getFileSizeInMb(bytes: Int) -> Double{
        var sizeMB = Double(bytes / 1024).rounded(.up)
        sizeMB = Double(sizeMB / 1024).rounded(.up)
        
        return sizeMB
    }
    class func dateTimeFormat(value : Double) -> String
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.dateTimeFormat
        let dateTimeForm = Date(timeIntervalSince1970: value)
        let dateTime = inputFormatter.string(from: dateTimeForm)
        return dateTime
    }
    
    class func dateTimeFromString(value : String) -> Double
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = AppConstants.dateTimeFormat
        let dateTime = inputFormatter.date(from: value)
        let timeInterval = dateTime!.timeIntervalSince1970
        let dateTimeInDouble = Double(timeInterval)
        return dateTimeInDouble
    }
    
    class func noDataLable(table : UITableView)
    {
        let noDataLabel : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: table.bounds.size.width, height: table.bounds.size.height))
        noDataLabel.text = "No Data Available!"
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = NSTextAlignment.center
        table.backgroundView = noDataLabel
    }
    
    class func setGradientBackground(view: UIView,allCorenersRound: Bool = false) {
  
        let colorStart =  AppColors.themeStartColor.cgColor
        let colorEnd =   AppColors.themeEndColor.cgColor
          
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorStart, colorEnd]
        gradientLayer.frame = view.bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
                 
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                 
                 
        view.layer.insertSublayer(gradientLayer, at:0)
           
    }
    
    
     class  func setNavigationBar(navController: UINavigationController?){
         navController?.navigationBar.shadowImage = UIImage()
        // navController?.navigationBar.isTranslucent = false
        /// navController?.view.backgroundColor = .clear
         
         if let navigationBar = navController?.navigationBar {
             //  let gradient = CAGradientLayer()
             var bounds = navigationBar.bounds
             
             bounds.size.height += UIApplication.shared.statusBarFrame.size.height
             let gradient = getGradient(bounds: bounds)
             
             if let image = getImageFrom(gradientLayer: gradient) {
                 navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
             }
         }
     }
    
    class func getGradient(bounds: CGRect) -> CAGradientLayer{
               let gradient = CAGradientLayer()
            let colorStart =  AppColors.themeStartColor.cgColor
               let colorEnd =  AppColors.themeEndColor.cgColor
               gradient.colors = [colorStart, colorEnd]
               gradient.frame = bounds
               gradient.startPoint = CGPoint(x: 0, y: 0)
               gradient.endPoint = CGPoint(x: 1, y: 0)
               
               return gradient
           }
         
         
    class func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
               var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
        gradientLayer.render(in: context)
        gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
               return gradientImage
    }
    
    
    
    
}

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
