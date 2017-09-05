//
//  CustomWeatherInfo2.swift
//  AccessibleWeather
//
//  Created by Saqlain Golandaz on 3/28/16.
//  Copyright © 2016 SaqlainGolandaz. All rights reserved.
//

import UIKit

class CustomWeatherInfo2: UITableViewController {
    
    var location:String = ""
    var listOfCities : [String] = []
    var contrast:String = "Contrast"
    var desiredCity:String = ""
    var cell:UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertView()
        alert.title = "Specific City"
        alert.message = "There are numerous cities with the entered name. Please select the desired city."
        alert.addButtonWithTitle("Ok")
        alert.show()
        
        print(location)
        let session = NSURLSession.sharedSession()
        let url = NSURL(string:"http://autocomplete.wunderground.com/aq?query=" + location)
        
        let returnedData = NSData(contentsOfURL: url!)
        var error: NSError?
        var parsedData:NSDictionary = [:]
        
        do {
            parsedData = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers)as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
        }

        var mainArr : NSArray = parsedData["RESULTS"] as! NSArray
        for(var i = 0; i < mainArr.count; i++) {
            var fullName : String = mainArr[i]["name"] as! String
            listOfCities.append(fullName)
        }
//        print(listOfCities)
        
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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        cell!.textLabel?.text = listOfCities[indexPath.row]
//        cell!.accessoryType = .DetailButton
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCities.count
    }
    
//    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
//        desiredCity = listOfCities[indexPath.row]
//        print(listOfCities[indexPath.row])
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "finalSegue") {
            desiredCity = listOfCities[(tableView.indexPathForSelectedRow?.row)!]
            desiredCity = desiredCity.stringByReplacingOccurrencesOfString(", ", withString: "%20")
            desiredCity = desiredCity.stringByReplacingOccurrencesOfString(" ", withString: "%20")
            var newController = segue.destinationViewController as! CustomWeatherInfo3
            
            newController.finalCity = desiredCity
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
