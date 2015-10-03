//
//  FirstViewController.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func logout(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navControl = storyboard.instantiateViewControllerWithIdentifier("NavControl") as! UINavigationController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = navControl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

