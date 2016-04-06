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
//    @IBOutlet weak var stateBar: UITextField!
    @IBOutlet weak var weatherInfoButton: UIButton!
//    @IBOutlet weak var weatherInfo: UILabel!
    
    var weatherString:String = ""
    var cityBarString:String = ""
    var contrast:String = "Contrast"
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "go" {
            
            if (cityBar.text!.isEmpty) {
                
                let alert = UIAlertView()
                alert.title = "No Text Detected"
                alert.message = "Please Enter City Name In The Box"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                return false
            }
                
            else {
                print(cityBar.text)
                cityBarString = cityBar.text! as String
                cityBarString = cityBarString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
                return true
            }
        }

        
        // by default, transition
        return true
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        cityBar.resignFirstResponder()
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "go") {
            var newController = segue.destinationViewController as! CustomWeatherInfo2
            
            newController.location = cityBarString
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setColor()
        
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
            cityBar.textColor = UIColor.whiteColor()
            cityBar.backgroundColor = UIColor.darkGrayColor()
            
            weatherInfoButton.tintColor = UIColor.orangeColor()
        }
        else
        {
        
        }
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
