//
//  LeftSideViewController.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import UIKit
import Eureka

class LeftSideViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true;
        tableView?.backgroundColor = self.hexStringToUIColor("2D2D2D")
        
        form +++ Section("Your Account")
            <<< ButtonRow("History"){ $0.title = "History"}.cellSetup{cell, row in cell.backgroundColor = self.hexStringToUIColor("424242"); cell.tintColor = UIColor.whiteColor()}
            <<< ButtonRow("settings"){ $0.title = "Settings"}.cellSetup{cell, row in cell.backgroundColor = self.hexStringToUIColor("424242"); cell.tintColor = UIColor.whiteColor()}
            <<< ButtonRow("listings"){ $0.title = "Add a Listing..."}.cellSetup{cell, row in cell.backgroundColor = self.hexStringToUIColor("424242"); cell.tintColor = UIColor.whiteColor()}
        +++ Section("Explore")
            <<< ButtonRow("explorevendor"){ $0.title = "Find a Job"}.cellSetup{cell, row in cell.backgroundColor = self.hexStringToUIColor("424242"); cell.tintColor = UIColor.whiteColor()}
            <<< ButtonRow("explorecustomer"){ $0.title = "Get a Job Done"}.cellSetup{cell, row in cell.backgroundColor = self.hexStringToUIColor("424242"); cell.tintColor = UIColor.whiteColor()}
        +++ Section("Inbox")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
