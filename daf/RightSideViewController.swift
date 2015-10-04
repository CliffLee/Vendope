//
//  RightSideViewController.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import UIKit
import Eureka

class RightSideViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form +++ Section("") +++ Section("")
        +++ Section("Categories")
            <<< SwitchRow(){ $0.title = "Automechanic" }
            <<< SwitchRow(){ $0.title = "Beauty & Spas" }
            <<< SwitchRow(){ $0.title = "Food" }
            <<< SwitchRow(){ $0.title = "Home Services" }
            <<< SwitchRow(){ $0.title = "Pet Care" }
            <<< SwitchRow(){ $0.title = "Shopping" }
            <<< SwitchRow(){ $0.title = "Tutoring" }
        +++ Section("Distance")
            <<< SegmentedRow<String>() { $0.options = ["1 mi.", "2 mi.", "3 mi.", "4 mi."] }
        +++ Section("Price")
            <<< SegmentedRow<String>() { $0.options = ["$", "$$", "$$$", "$$$$"] }
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
