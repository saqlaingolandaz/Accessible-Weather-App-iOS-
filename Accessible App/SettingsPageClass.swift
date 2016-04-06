//
//  SettingsPageClass.swift
//  AccessibleWeather
//
//  Created by Kaushik Santhanam on 2/8/16.
//  Copyright © 2016 SaqlainGolandaz. All rights reserved.
//

import UIKit

class SettingsPageClass: UIViewController {

    @IBOutlet weak var UnitsCelsiusFarenheitSwitcher: UISegmentedControl!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var soundsSwitch: UISwitch!
    @IBOutlet weak var contrastSwitch: UISwitch!
    @IBOutlet weak var contrastLabel: UILabel!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var SettingsPageTitle: UILabel!
    @IBOutlet weak var gatechLabel: UILabel!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var currentWeatherButton: UIBarButtonItem!
    
    
    var notification:String = "Notifications"
    var sounds:String = "Sounds"
    var units:String = "Units"
    var contrast:String = "Contrast"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Get user saved values for Settings
        setValueForSettings()

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
    
    @IBAction func UnitsValueChanged(sender: UISegmentedControl)
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(sender.selectedSegmentIndex, forKey: units)
    }
    
    @IBAction func notificationsValueChanged(sender: UISwitch)
    {
        let refreshAlert = UIAlertController(title: "Notifications Enable/Disable", message: "Notifications can be enabled/disabled only through Settings menu.", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
        notificationSwitch.setOn(!notificationSwitch.on, animated: true)
    }
    
    @IBAction func soundsValueChanged(sender: UISwitch)
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(sender.on, forKey: sounds)
    }
    
    
    @IBAction func contrastEnabled(sender: UISwitch)
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(sender.on, forKey: contrast)
        changeContrast(sender.on)
    
    }
    
    func changeContrast(setContrast: Bool)
    {
        if(setContrast)
        {
            self.view.backgroundColor = UIColor.blackColor()
            SettingsPageTitle.textColor = UIColor.whiteColor()
            unitsLabel.textColor = UIColor.whiteColor()
            notificationLabel.textColor = UIColor.whiteColor()
            soundLabel.textColor = UIColor.whiteColor()
            contrastLabel.textColor = UIColor.whiteColor()
            contrastSwitch.onTintColor = UIColor.purpleColor()
            notificationSwitch.onTintColor = UIColor.purpleColor()
            soundsSwitch.onTintColor = UIColor.purpleColor()
            gatechLabel.textColor = UIColor.whiteColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.whiteColor()
            SettingsPageTitle.textColor = UIColor.blackColor()
            unitsLabel.textColor = UIColor.blackColor()
            notificationLabel.textColor = UIColor.blackColor()
            soundLabel.textColor = UIColor.blackColor()
            contrastLabel.textColor = UIColor.blackColor()
            contrastSwitch.onTintColor = UIColor.greenColor()
            notificationSwitch.onTintColor = UIColor.greenColor()
            soundsSwitch.onTintColor = UIColor.greenColor()
            gatechLabel.textColor = UIColor.blackColor()
        }
        self.setNeedsStatusBarAppearanceUpdate()
    }

    func setValueForSettings()
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let value:Int = userDefaults.integerForKey(units){
            
            UnitsCelsiusFarenheitSwitcher.selectedSegmentIndex = value
        }
        else
        {
            UnitsCelsiusFarenheitSwitcher.selectedSegmentIndex = 2;
        }
        
        // Notification settings
        let notificationType = UIApplication.sharedApplication().currentUserNotificationSettings()!.types
        if notificationType == UIUserNotificationType.None {
            // Push notifications are disabled in setting by user.
            notificationSwitch.setOn(false, animated: true)
        }else{
            notificationSwitch.setOn(true, animated: true)
            
        }
        
        
        // Sounds settings
        if let soundsValue:Bool = userDefaults.boolForKey(sounds){
            soundsSwitch.setOn(soundsValue, animated: true)
        }
        else
        {
            soundsSwitch.setOn(true, animated: true)
        }
        
        // Contrast settings
        if let contrastValue:Bool = userDefaults.boolForKey(contrast){
            contrastSwitch.setOn(contrastValue, animated: true)
            changeContrast(contrastValue)
        }
        else
        {
            contrastSwitch.setOn(false, animated: true)
            changeContrast(false)
        }
        
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
