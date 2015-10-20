//
//  CustomWeatherInfo.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 10/19/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit

class CustomWeatherInfo: UIViewController {
    
    @IBOutlet weak var cityBar: UITextField!
    @IBOutlet weak var stateBar: UITextField!
    @IBOutlet weak var weatherInfoButton: UIButton!
    @IBOutlet weak var weatherInfo: UILabel!
    
    var weatherString:String = ""
    

    @IBAction func buttonPressed(sender: AnyObject) {
        if(cityBar.text == "" && stateBar.text == "") {
            self.weatherInfo.text = "Please Enter City and State/Country Name"
        } else if(cityBar.text == "" && stateBar.text != "") {
            self.weatherInfo.text = "Please Enter City Name"
        } else if(stateBar.text == "" && cityBar.text != "") {
            self.weatherInfo.text = "Please Enter State/Country Name"
        }
        
        var cityBarString:String = cityBar.text as String
        let newString = cityBarString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        var stateBarString:String = stateBar.text as String
        let newString2 = stateBarString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string:"http://api.wunderground.com/api/16337742f9b11efe/conditions/q/" + newString + "%20" + newString2 + ".json")
        let returnedData = NSData(contentsOfURL: url!)
        var error: NSError?
        var parsedData: NSDictionary = NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers, error: &error)as NSDictionary
        
        var topLevel:NSDictionary = parsedData["current_observation"] as NSDictionary
        var secondLevel:NSDictionary = topLevel["display_location"] as NSDictionary
        
        self.weatherString = secondLevel["full"] as NSString + "\n"
        self.weatherString += topLevel["temperature_string"] as NSString + "\n"
        self.weatherString += "Feels Like: "
        self.weatherString += topLevel["feelslike_string"] as NSString + "\n"
        self.weatherString += "Precipitation: "
        self.weatherString += topLevel["precip_today_string"] as NSString
        println(self.weatherString)
        self.weatherInfo.text = self.weatherString
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
