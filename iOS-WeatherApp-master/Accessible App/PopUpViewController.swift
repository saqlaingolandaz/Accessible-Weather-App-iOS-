//
//  PopUpViewController.swift
//  AccessibleWeather
//
//  Created by Sonify on 4/21/17.
//  Copyright © 2017 SaqlainGolandaz. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var high: UILabel!
    @IBOutlet weak var low: UILabel!
    @IBOutlet weak var chanceOfRain: UILabel!
    @IBOutlet weak var forecast: UILabel!
    @IBOutlet weak var averageHumidity: UILabel!
    
    @IBOutlet weak var popupView: UIView!
    
    var highString:String = ""
    var lowString:String = ""
    var chanceOfRainString:String = ""
    var forecastString:String = ""
    var averageHumidityString:String = ""
    
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
//        self.day1String = date1["weekday"] as! NSString as String
//        self.day1.text = self.day1String
        self.forecastString = days1["conditions"] as! NSString as String
        self.forecast.text = self.forecastString
        var high1:NSDictionary = days1["high"] as! NSDictionary
        var hi1:NSString = high1["fahrenheit"] as! NSString
        //FAHRENHEIT TO CELSIUS CONVERSION GOES HERE
        self.highString = "High: " + (hi1 as String) + "ºF"
        self.high.text = self.highString
        var low1:NSDictionary = days1["low"] as! NSDictionary
        var lo1:NSString = low1["fahrenheit"] as! NSString
        self.lowString = "Low: " + (lo1 as String) + "ºF"
        self.low.text = self.lowString
//        var img1:NSString = days1["icon_url"] as! NSString
//        var pic1 = NSURL(string: img1 as String)
//        var pic11 = NSData(contentsOfURL: pic1!)
//        self.icon1.image = UIImage(data: pic11!)
        var rainIsWeird1:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird11:NSDictionary = rainIsWeird1[2] as! NSDictionary
        var rainIsWeird111:NSString = rainIsWeird11["pop"] as! NSString
        self.chanceOfRainString = "Chance of Rain: " + (rainIsWeird111 as String) + "%"
        self.chanceOfRain.text = self.chanceOfRainString
//        var testing = days1["avehumidity"]
//        var newDetail;
//        newDetail.setQuantity(NSString(format: "%@", testing) as String)
//        print("humidity:")
//        print(testing)
        self.averageHumidity.text = "Average Humidity: 49%"
    }
    
    
    
    @IBAction func closePopUp(sender: AnyObject) {
        print("back")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyData()
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true

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
