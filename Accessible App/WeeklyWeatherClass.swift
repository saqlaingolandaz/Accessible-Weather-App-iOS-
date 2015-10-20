//
//  WeeklyWeatherClass.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/23/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit

class WeeklyWeatherClass: UIViewController {
    
    
    @IBOutlet weak var time1Label: UILabel!
    
    var time1String:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyData()
    }
    
    func weeklyData() {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string:"http://api.wunderground.com/api/16337742f9b11efe/forecast10day/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        var error: NSError?
        var parsedData: NSDictionary = NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers, error: &error)as NSDictionary
        
        var main:NSDictionary = parsedData["forecast"] as NSDictionary
        var simpleForecast:NSDictionary = main["simpleforecast"] as NSDictionary
        var forecastDay:NSArray = simpleForecast["forecastday"] as NSArray
        var days:NSDictionary = forecastDay[0] as NSDictionary
        var date1:NSDictionary = days["date"] as NSDictionary
        self.time1String = date1["weekday"] as NSString
        self.time1Label.text = self.time1String
        

        
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
