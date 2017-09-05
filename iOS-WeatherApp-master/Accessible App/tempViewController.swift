//
//  tempViewController.swift
//  AccessibleWeather
//
//  Created by Sonify on 4/3/17.
//  Copyright © 2017 SaqlainGolandaz. All rights reserved.
//

import UIKit

class tempViewController: UIViewController {
    
    
    @IBOutlet weak var scroll: UIScrollView!
    
    var contrast:String = "Contrast"
    
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var high1: UILabel!
    @IBOutlet weak var low1: UILabel!
    @IBOutlet weak var forecast1: UILabel!
    @IBOutlet weak var precip1: UILabel!
    @IBOutlet weak var icon1: UIImageView!
    
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var high2: UILabel!
    @IBOutlet weak var low2: UILabel!
    @IBOutlet weak var forecast2: UILabel!
    @IBOutlet weak var precip2: UILabel!
    @IBOutlet weak var icon2: UIImageView!
    
    @IBOutlet weak var day3: UILabel!
    @IBOutlet weak var high3: UILabel!
    @IBOutlet weak var low3: UILabel!
    @IBOutlet weak var forecast3: UILabel!
    @IBOutlet weak var precip3: UILabel!
    @IBOutlet weak var icon3: UIImageView!
    
    @IBOutlet weak var day4: UILabel!
    @IBOutlet weak var high4: UILabel!
    @IBOutlet weak var low4: UILabel!
    @IBOutlet weak var forecast4: UILabel!
    @IBOutlet weak var precip4: UILabel!
    @IBOutlet weak var icon4: UIImageView!
    
    @IBOutlet weak var day5: UILabel!
    @IBOutlet weak var high5: UILabel!
    @IBOutlet weak var low5: UILabel!
    @IBOutlet weak var forecast5: UILabel!
    @IBOutlet weak var precip5: UILabel!
    @IBOutlet weak var icon5: UIImageView!
    
    @IBOutlet weak var day6: UILabel!
    @IBOutlet weak var high6: UILabel!
    @IBOutlet weak var low6: UILabel!
    @IBOutlet weak var forecast6: UILabel!
    @IBOutlet weak var precip6: UILabel!
    @IBOutlet weak var icon6: UIImageView!
    
    @IBOutlet weak var day7: UILabel!
    @IBOutlet weak var high7: UILabel!
    @IBOutlet weak var low7: UILabel!
    @IBOutlet weak var forecast7: UILabel!
    @IBOutlet weak var precip7: UILabel!
    @IBOutlet weak var icon7: UIImageView!
    
    var day1String:String = ""
    var high1String:String = ""
    var low1String:String = ""
    var forecast1String:String = ""
    var precip1String:String = ""
    var icon1String:String = ""
    
    var day2String:String = ""
    var high2String:String = ""
    var low2String:String = ""
    var forecast2String:String = ""
    var precip2String:String = ""
    var icon2String:String = ""
    
    var day3String:String = ""
    var high3String:String = ""
    var low3String:String = ""
    var forecast3String:String = ""
    var precip3String:String = ""
    var icon3String:String = ""
    
    var day4String:String = ""
    var high4String:String = ""
    var low4String:String = ""
    var forecast4String:String = ""
    var precip4String:String = ""
    var icon4String:String = ""
    
    var day5String:String = ""
    var high5String:String = ""
    var low5String:String = ""
    var forecast5String:String = ""
    var precip5String:String = ""
    var icon5String:String = ""
    
    var day6String:String = ""
    var high6String:String = ""
    var low6String:String = ""
    var forecast6String:String = ""
    var precip6String:String = ""
    var icon6String:String = ""
    
    var day7String:String = ""
    var high7String:String = ""
    var low7String:String = ""
    var forecast7String:String = ""
    var precip7String:String = ""
    var icon7String:String = ""
    
    func weeklyData() {
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/forecast10day/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        
        var parsedData:NSDictionary = [:]
        
        do {
            parsedData = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers)as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        
        var main:NSDictionary = parsedData["forecast"] as! NSDictionary
        var simpleForecast:NSDictionary = main["simpleforecast"] as! NSDictionary
        var forecastDay:NSArray = simpleForecast["forecastday"] as! NSArray
        var txtForecast:NSDictionary = main["txt_forecast"] as! NSDictionary
        
        
        
        var days1:NSDictionary = forecastDay[1] as! NSDictionary
        var date1:NSDictionary = days1["date"] as! NSDictionary
        self.day1String = date1["weekday"] as! NSString as String
        self.day1.text = self.day1String
        self.forecast1String = days1["conditions"] as! NSString as String
        self.forecast1.text = self.forecast1String
        var high1:NSDictionary = days1["high"] as! NSDictionary
        var hi1:NSString = high1["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.high1String = "High: " + (hi1 as String) + "ºF"
        self.high1.text = self.high1String
        var low1:NSDictionary = days1["low"] as! NSDictionary
        var lo1:NSString = low1["fahrenheit"] as! NSString
        self.low1String = "Low: " + (lo1 as String) + "ºF"
        self.low1.text = self.low1String
        var img1:NSString = days1["icon_url"] as! NSString
        var pic1 = NSURL(string: img1 as String)
        var pic11 = NSData(contentsOfURL: pic1!)
        self.icon1.image = UIImage(data: pic11!)
        var rainIsWeird1:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird11:NSDictionary = rainIsWeird1[2] as! NSDictionary
        var rainIsWeird111:NSString = rainIsWeird11["pop"] as! NSString
        self.precip1String = "Chance of Rain: " + (rainIsWeird111 as String) + "%"
        self.precip1.text = self.precip1String
        
        
        var days2:NSDictionary = forecastDay[2] as! NSDictionary
        var date2:NSDictionary = days2["date"] as! NSDictionary
        self.day2String = date2["weekday"] as! NSString as String
        self.day2.text = self.day2String
        self.forecast2String = days2["conditions"] as! NSString as String
        self.forecast2.text = self.forecast2String
        var high2:NSDictionary = days2["high"] as! NSDictionary
        var hi2:NSString = high2["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.high2String = "High: " + (hi2 as String) + "ºF"
        self.high2.text = self.high2String
        var low2:NSDictionary = days2["low"] as! NSDictionary
        var lo2:NSString = low2["fahrenheit"] as! NSString
        self.low2String = "Low: " + (lo2 as String) + "ºF"
        self.low2.text = self.low2String
        var img2:NSString = days2["icon_url"] as! NSString
        var pic2 = NSURL(string: img2 as String)
        var pic22 = NSData(contentsOfURL: pic2!)
        self.icon2.image = UIImage(data: pic22!)
        var rainIsWeird2:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird22:NSDictionary = rainIsWeird1[4] as! NSDictionary
        var rainIsWeird222:NSString = rainIsWeird22["pop"] as! NSString
        self.precip2String = "Chance of Rain: " + (rainIsWeird222 as String) + "%"
        self.precip2.text = self.precip2String
        
        
        var days3:NSDictionary = forecastDay[3] as! NSDictionary
        var date3:NSDictionary = days3["date"] as! NSDictionary
        self.day3String = date3["weekday"] as! NSString as String
        self.day3.text = self.day3String
        self.forecast3String = days3["conditions"] as! NSString as String
        self.forecast3.text = self.forecast3String
        var high3:NSDictionary = days3["high"] as! NSDictionary
        var hi3:NSString = high3["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.high3String = "High: " + (hi3 as String) + "ºF"
        self.high3.text = self.high3String
        var low3:NSDictionary = days3["low"] as! NSDictionary
        var lo3:NSString = low3["fahrenheit"] as! NSString
        self.low3String = "Low: " + (lo3 as String) + "ºF"
        self.low3.text = self.low3String
        var img3:NSString = days3["icon_url"] as! NSString
        var pic3 = NSURL(string: img3 as String)
        var pic33 = NSData(contentsOfURL: pic3!)
        self.icon3.image = UIImage(data: pic33!)
        var rainIsWeird3:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird33:NSDictionary = rainIsWeird1[6] as! NSDictionary
        var rainIsWeird333:NSString = rainIsWeird33["pop"] as! NSString
        self.precip3String = "Chance of Rain: " + (rainIsWeird333 as String) + "%"
        self.precip3.text = self.precip3String
        
        
        var days4:NSDictionary = forecastDay[4] as! NSDictionary
        var date4:NSDictionary = days4["date"] as! NSDictionary
        self.day4String = date4["weekday"] as! NSString as String
        self.day4.text = self.day4String
        self.forecast4String = days4["conditions"] as! NSString as String
        self.forecast4.text = self.forecast4String
        var high4:NSDictionary = days4["high"] as! NSDictionary
        var hi4:NSString = high4["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.high4String = "High: " + (hi4 as String) + "ºF"
        self.high4.text = self.high4String
        var low4:NSDictionary = days4["low"] as! NSDictionary
        var lo4:NSString = low4["fahrenheit"] as! NSString
        self.low4String = "Low: " + (lo4 as String) + "ºF"
        self.low4.text = self.low4String
        var img4:NSString = days4["icon_url"] as! NSString
        var pic4 = NSURL(string: img4 as String)
        var pic44 = NSData(contentsOfURL: pic4!)
        self.icon4.image = UIImage(data: pic44!)
        var rainIsWeird4:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird44:NSDictionary = rainIsWeird1[8] as! NSDictionary
        var rainIsWeird444:NSString = rainIsWeird44["pop"] as! NSString
        self.precip4String = "Chance of Rain: " + (rainIsWeird444 as String) + "%"
        self.precip4.text = self.precip4String
        
        
        var days5:NSDictionary = forecastDay[5] as! NSDictionary
        var date5:NSDictionary = days5["date"] as! NSDictionary
        self.day5String = date5["weekday"] as! NSString as String
        self.day5.text = self.day5String
        self.forecast5String = days5["conditions"] as! NSString as String
        self.forecast5.text = self.forecast5String
        var high5:NSDictionary = days5["high"] as! NSDictionary
        var hi5:NSString = high5["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.high5String = "High: " + (hi5 as String) + "ºF"
        self.high5.text = self.high5String
        var low5:NSDictionary = days5["low"] as! NSDictionary
        var lo5:NSString = low5["fahrenheit"] as! NSString
        self.low5String = "Low: " + (lo5 as String) + "ºF"
        self.low5.text = self.low5String
        var img5:NSString = days5["icon_url"] as! NSString
        var pic5 = NSURL(string: img5 as String)
        var pic55 = NSData(contentsOfURL: pic5!)
        self.icon5.image = UIImage(data: pic55!)
        var rainIsWeird5:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird55:NSDictionary = rainIsWeird1[10] as! NSDictionary
        var rainIsWeird555:NSString = rainIsWeird55["pop"] as! NSString
        self.precip5String = "Chance of Rain: " + (rainIsWeird555 as String) + "%"
        self.precip5.text = self.precip5String
        
        
//        var days6:NSDictionary = forecastDay[6] as! NSDictionary
//        print("day 6:")
//        print(day6)
//        var date6:NSDictionary = days6["date"] as! NSDictionary
//        self.day6String = date6["weekday"] as! NSString as String
//        self.day6.text = self.day6String
//        self.forecast6String = days6["conditions"] as! NSString as String
//        self.forecast6.text = self.forecast6String
//        var high6:NSDictionary = days6["high"] as! NSDictionary
//        var hi6:NSString = high6["fahrenheit"] as! NSString
//        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
//        self.high6String = "High: " + (hi6 as String) + "ºF"
//        self.high6.text = self.high6String
//        var low6:NSDictionary = days6["low"] as! NSDictionary
//        var lo6:NSString = low6["fahrenheit"] as! NSString
//        self.low6String = "Low: " + (lo6 as String) + "ºF"
//        self.low6.text = self.low6String
//        var img6:NSString = days6["icon_url"] as! NSString
//        var pic6 = NSURL(string: img6 as String)
//        var pic66 = NSData(contentsOfURL: pic6!)
//        self.icon6.image = UIImage(data: pic66!)
//        var rainIsWeird6:NSArray = txtForecast["forecastday"] as! NSArray
//        var rainIsWeird66:NSDictionary = rainIsWeird1[12] as! NSDictionary
//        var rainIsWeird666:NSString = rainIsWeird66["pop"] as! NSString
//        self.precip6String = "Chance of Rain: " + (rainIsWeird666 as String) + "%"
//        self.precip6.text = self.precip6String
//        
//        
//        var days7:NSDictionary = forecastDay[7] as! NSDictionary
//        var date7:NSDictionary = days7["date"] as! NSDictionary
//        self.day7String = date7["weekday"] as! NSString as String
//        self.day7.text = self.day7String
//        self.forecast7String = days7["conditions"] as! NSString as String
//        self.forecast7.text = self.forecast7String
//        var high7:NSDictionary = days7["high"] as! NSDictionary
//        var hi7:NSString = high7["fahrenheit"] as! NSString
//        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
//        self.high7String = "High: " + (hi7 as String) + "ºF"
//        self.high7.text = self.high7String
//        var low7:NSDictionary = days7["low"] as! NSDictionary
//        var lo7:NSString = low7["fahrenheit"] as! NSString
//        self.low7String = "Low: " + (lo7 as String) + "ºF"
//        self.low7.text = self.low7String
//        var img7:NSString = days7["icon_url"] as! NSString
//        var pic7 = NSURL(string: img7 as String)
//        var pic77 = NSData(contentsOfURL: pic7!)
//        self.icon7.image = UIImage(data: pic77!)
//        var rainIsWeird7:NSArray = txtForecast["forecastday"] as! NSArray
//        var rainIsWeird77:NSDictionary = rainIsWeird1[14] as! NSDictionary
//        var rainIsWeird777:NSString = rainIsWeird77["pop"] as! NSString
//        self.precip7String = "Chance of Rain: " + (rainIsWeird777 as String) + "%"
//        self.precip7.text = self.precip7String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.contentSize.height = 1300
        weeklyData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
