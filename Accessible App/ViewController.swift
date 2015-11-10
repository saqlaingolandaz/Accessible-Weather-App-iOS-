//
//  ViewController.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/2/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    
    
    var cityString:String = ""
    var tempString:String = ""
    var feelsLikeString:String = ""
    var precipString:String = ""
    var forecastString:String = ""
    
    var bgMusic:AVAudioPlayer = AVAudioPlayer()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setWeatherInfo()
        if self.forecastString == "sunny" || self.forecastString == "clear" || self.forecastString == "mostlysunny" || self.forecastString == "partlysunny" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Sun", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        } else if self.forecastString == "cloudy" || self.forecastString == "mostlycloudy" || self.forecastString == "partlycloudy" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Cloud", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        } else if self.forecastString == "chancerain" || self.forecastString == "rain" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Rain", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        } else if self.forecastString == "chancetstorms" || self.forecastString == "tstorms" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Thunder", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        } else if self.forecastString == "chanceflurries" || self.forecastString == "chancesleet" || self.forecastString == "chancesnow" || self.forecastString == "flurries" || self.forecastString == "sleet" || self.forecastString == "snow" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Snow", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        } else if self.forecastString == "hazy" || self.forecastString == "fog" {
            let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Fog", withExtension: "wav")!
            do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) }
            catch {
                return print("no music file")
            }
            bgMusic.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWeatherInfo() {
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

        self.tempString = topLevel["temperature_string"] as! String
        temperatureLabel.text = self.tempString

        self.feelsLikeString = topLevel["feelslike_string"] as! String
        feelsLikeLabel.text = "Feels Like: " + self.feelsLikeString

        self.precipString = topLevel["precip_today_string"] as! String
        precipLabel.text = "Precipitation: " + self.precipString
        
        self.forecastString = topLevel["icon"] as! String
        print(self.forecastString)
    }


}

