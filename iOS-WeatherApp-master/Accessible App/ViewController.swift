//
//  ViewController.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/2/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    
    
    var cityString:String = ""
    var tempString:String = ""
    var feelsLikeString:String = ""
    var precipString:String = ""
    var forecastString:String = ""
    var weatherString:String = ""
    
    var notification:String = "Notifications"
    var sounds:String = "Sounds"
    var units:String = "Units"
    var contrast:String = "Contrast"
    
    
    var sun = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Sun", ofType: "wav")!)
    var snow = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Snow", ofType: "wav")!)
    var rain = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Rain", ofType: "wav")!)
    var ice = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ice", ofType: "wav")!)
    var fog = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Fog", ofType: "wav")!)
    var cloud = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Cloud", ofType: "wav")!)
    var wind = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Wind", ofType: "wav")!)
    var thunder = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Thunder", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

//
//        view.backgroundColor = UIColor.grayColor()
        
        
        setColor()
        let weather = setWeatherInfo()
        print(weather)
        
        //Play sounds based on whether the user has switched on sounds in the settings page
        let userPrefs = NSUserDefaults.standardUserDefaults()
        var playSound:Bool = true
        
        if let soundsValue:Bool = userPrefs.boolForKey(sounds){
            playSound = soundsValue
        }
        
        if(playSound)
        {
            
            if (weather == "sunny" || weather == "clear" || weather == "nt_clear" || weather == "nt_sunny" || weather == "mostlysunny" || weather == "partlysunny" || weather == "nt_mostlysunny" || weather == "nt_partlysunny") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: sun)
                } catch {
                    print("No sound found by URL:\(sun)")
                }
                audioPlayer.play()
            } else if (weather == "cloudy" || weather == "partlycloudy" || weather == "nt_cloudy" || weather == "nt_partlycloudy" || weather == "mostlycloudy" || weather == "nt_mostlycloudy") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: cloud)
                } catch {
                    print("No sound found by URL:\(cloud)")
                }
                audioPlayer.play()
            } else if (weather == "chanceflurries" || weather == "chancesnow" || weather == "flurries" || weather == "snow" || weather == "nt_chanceflurries" || weather == "nt_chancesnow" || weather == "nt_flurries" || weather == "nt_snow") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: snow)
                } catch {
                    print("No sound found by URL:\(snow)")
                }
                audioPlayer.play()
            } else if (weather == "fog" || weather == "hazy" || weather == "nt_fog" || weather == "nt_hazy") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: fog)
                } catch {
                    print("No sound found by URL:\(fog)")
                }
                audioPlayer.play()
            } else if (weather == "tstorms" || weather == "chancetstorms" || weather == "nt_tstorms" || weather == "nt_chancetstorms" ) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: thunder)
                } catch {
                    print("No sound found by URL:\(thunder)")
                }
                audioPlayer.play()
            } else if (weather == "sleet" || weather == "chancesleet" || weather == "nt_sleet" || weather == "nt_chancesleet" ) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: ice)
                } catch {
                    print("No sound found by URL:\(ice)")
                }
                audioPlayer.play()
            } else if (weather == "rain" || weather == "chancerain" || weather == "nt_rain" || weather == "nt_chancerain" ) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: rain)
                } catch {
                    print("No sound found by URL:\(rain)")
                }
                audioPlayer.play()
            }
        }
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation: CLLocation = locations[locations.count - 1]
        
        print(lastLocation.coordinate.latitude)
    }
    
    
override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
    
        let userPrefs = NSUserDefaults.standardUserDefaults()
        var contrastVal:Bool = false
        
        if let contrastValue:Bool = userPrefs.boolForKey(contrast){
            contrastVal = contrastValue
        }
        
        if(contrastVal)
        {
    
        return UIStatusBarStyle.LightContent
        }
        else{
            return UIStatusBarStyle.Default
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setColor()
    {
        let userPrefs = NSUserDefaults.standardUserDefaults()
        var contrastVal:Bool = false
        
        if let contrastValue:Bool = userPrefs.boolForKey(contrast){
            contrastVal = contrastValue
        }

        if(contrastVal)
        {
            self.view.backgroundColor = UIColor.blackColor()
            locationLabel.textColor = UIColor.whiteColor()
            temperatureLabel.textColor = UIColor.whiteColor()
            feelsLikeLabel.textColor = UIColor.whiteColor()
            precipLabel.textColor = UIColor.whiteColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.whiteColor()
            locationLabel.textColor = UIColor.blackColor()
            temperatureLabel.textColor = UIColor.blackColor()
            feelsLikeLabel.textColor = UIColor.blackColor()
            precipLabel.textColor = UIColor.blackColor()
        }
    }
    


    
    func setWeatherInfo() -> String {
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/conditions/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        
        var parsedObject:NSDictionary = [:]
        
        do {
            parsedObject = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        
        let topLevel: NSDictionary = parsedObject["current_observation"] as! NSDictionary
        let secondLevel: NSDictionary = topLevel["display_location"] as! NSDictionary
        
        self.cityString = secondLevel["full"] as! String
        locationLabel.text = self.cityString
        
        //Get the default units value
        let userPrefs = NSUserDefaults.standardUserDefaults()
        var farenheit:Bool = false
        var units:String = "Units"
        
        if let value:Int = userPrefs.integerForKey(units){
            if (value == 1)
            {
                farenheit = true
            }
            else
            {
                farenheit = false
            }
        }
        
        //Current Temperature
        if(farenheit){
            let temperature = topLevel["temp_f"] as! Int
            self.tempString = temperature.description
            temperatureLabel.text = self.tempString + "°" + "F"
            temperatureLabel.accessibilityLabel = "The current temperature is " + self.tempString + " °" + " Fahrenheit."
        }
        else
        {
            let temperature = topLevel["temp_c"] as! Int
            self.tempString = temperature.description
            temperatureLabel.text = self.tempString + "°" + "C"
            temperatureLabel.accessibilityLabel = "The current temperature is " + self.tempString + " °" + " Celsius."
        }
        
        
        // Feels like
        self.forecastString = topLevel["icon"] as! String
        if(farenheit){
            self.feelsLikeString = topLevel["feelslike_f"] as! String
            let intValue = (self.feelsLikeString as NSString).integerValue
            feelsLikeLabel.text = "Feels Like: " + intValue.description + "°" + "F"
        }
        else
        {
            self.feelsLikeString = topLevel["feelslike_c"] as! String
            let intValue = (self.feelsLikeString as NSString).integerValue
            feelsLikeLabel.text = "Feels Like: " + intValue.description + "°" + "C"
        }
        

        
        self.precipString = topLevel["precip_today_string"] as! String
        precipLabel.text = "Precipitation: " + self.precipString
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"noAction:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        
        if(UIApplication.sharedApplication().scheduledLocalNotifications?.count == 0){
            let notification:UILocalNotification = UILocalNotification()
            notification.category = "FIRST_CATEGORY"
            notification.alertBody = "Hourly Weather Update"
            notification.fireDate = NSDate(timeIntervalSinceNow: 3) //will fire 3 seconds after app is launched, as opposed to hardcoding a date
            notification.repeatInterval = NSCalendarUnit.Hour
            
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }
        
        //Not really sure what this commented code does. Either added by Kaushik or Thomas. Probably code for notifications
        
        /*
        if(UIApplication.sharedApplication().scheduledLocalNotifications?.count == 0){
        
        let notification = UILocalNotification()
        
        /* Time and timezone settings */
        notification.fireDate = NSDate(timeIntervalSinceNow: 8.0)
        notification.repeatInterval = NSCalendarUnit.Hour
        notification.timeZone = NSCalendar.currentCalendar().timeZone
        notification.alertBody = "Feels Like: " + self.feelsLikeString + ". " + "Precipitation: " + self.precipString
        
        /* Action settings */
        notification.hasAction = true
        notification.alertAction = "View"
        notification.soundName = UILocalNotificationDefaultSoundName
        /* Badge settings */
        notification.applicationIconBadgeNumber =
        UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        /* Additional information, user info */
        /*notification.userInfo = [
        "Key 1" : "Value 1",
        "Key 2" : "Value 2"
        ]*/
        
        /* Schedule the notification */
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }*/
        return self.forecastString
        
    }
    
    
    func noAction(notification:NSNotification){
            
            
    }
    
    
    //Notification method I'm assuming - written by Thomas
    func showAMessage(notification:NSNotification){
            let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/conditions/q/autoip.json")
            let returnedData = NSData(contentsOfURL: url!)
            
            var parsedObject:NSDictionary = [:]
            
            do {
            parsedObject = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
            }
            
            let topLevel: NSDictionary = parsedObject["current_observation"] as! NSDictionary
            
            self.feelsLikeString = topLevel["feelslike_string"] as! String
            self.weatherString = topLevel["weather"] as! String
            self.tempString = topLevel["temperature_string"] as! String
            self.precipString = topLevel["precip_today_string"] as! String
            
            
            let message:UIAlertController = UIAlertController(title: "Weather notification", message: "Weather: " + self.weatherString + ". " + "Temperature: " + self.tempString + ". " + "Precipitation: " + self.precipString, preferredStyle: UIAlertControllerStyle.Alert)
            message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(message, animated: true, completion: nil)
            
    }
    
    
}
