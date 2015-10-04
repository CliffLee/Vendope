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

        form
        +++ Section("") +++ Section("")
        +++ Section("Explore")
            <<< ButtonRow("explorevendor"){ $0.title = "Find a Job"}
            <<< ButtonRow("explorecustomer"){ $0.title = "Get a Job Done"}
        +++ Section("Your Account")
            <<< ButtonRow("History"){ $0.title = "History"}
            <<< ButtonRow("Inbox") { $0.title = "Inbox"}
            <<< ButtonRow("settings"){ $0.title = "Settings"}
            <<< ButtonRow("listings"){ $0.title = "Add a Listing..."}
            <<< ButtonRow("signout"){ $0.title = "Sign Out"}
        
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
