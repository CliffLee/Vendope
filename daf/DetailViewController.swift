//
//  FirstViewController.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import UIKit
import Parse
import Bolts

class DetailViewController: UIViewController {
    var index:Int?
    var service:PFObject?
    let singleton = Singleton.sharedInstance
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = singleton.indexDetail
        service = singleton.services[index!]
        
        self.title = service?.valueForKey("name") as! String
        print(service?.valueForKey("desc")! as! String)
        
        textViewDescription.text = service?.valueForKey("desc") as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

