//
//  CustomWeatherInfo3.swift
//  AccessibleWeather
//
//  Created by Saqlain Golandaz on 3/31/16.
//  Copyright © 2016 SaqlainGolandaz. All rights reserved.
//

import UIKit

class CustomWeatherInfo3: UIViewController {
    
    var finalCity:String = ""
    var cityName:String = ""
    @IBOutlet weak var weatherString: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName = finalCity.stringByReplacingOccurrencesOfString("%20", withString: " ")

        let alert = UIAlertView()
        alert.title = cityName
        alert.message = "Weather information has been loaded. Click Ok to continue"
        alert.addButtonWithTitle("Ok")
        alert.show()
//        print(finalCity)
        let session = NSURLSession.sharedSession()
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/conditions/q/" + finalCity + ".json")

        let returnedData = NSData(contentsOfURL: url!)
        var error: NSError?
        var parsedData:NSDictionary = [:]

        do {
        parsedData = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers)as! NSDictionary
        } catch let error as NSError {
        // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
        print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        
        //print(parsedData)
        
        var topLevel:NSDictionary = parsedData["current_observation"] as! NSDictionary
        var secondLevel:NSDictionary = topLevel["display_location"] as! NSDictionary
        
        self.weatherString.text = (secondLevel["full"] as! NSString as String) + "\n"
        self.weatherString.text = self.weatherString.text! + (topLevel["temperature_string"] as! NSString as String) + "\n"
        self.weatherString.text = self.weatherString.text! + "Feels Like: "
        self.weatherString.text = self.weatherString.text! + (topLevel["feelslike_string"] as! NSString as String) + "\n"
        self.weatherString.text = self.weatherString.text! + "Precipitation: "
        self.weatherString.text = self.weatherString.text! +  (topLevel["precip_today_string"] as! NSString as String)
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
