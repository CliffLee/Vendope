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
    @IBOutlet weak var textViewRating: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = singleton.indexDetail
        service = singleton.services[index!]
        
        self.title = service?.valueForKey("name") as! String
        self.navigationController!.navigationBar.topItem!.title = "";
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        textViewDescription.text = service?.valueForKey("desc") as! String
        let percentRating = service?.valueForKey("percentRating") as! Int
        textViewRating.text = "Rating: " + String(percentRating) + "%"
        ratingView.rating = (Double(percentRating)/100.0) * 5.0
        ratingView.settings.fillMode = StarFillMode.Precise
        let filePath = "pics/" + String(index!) + ".jpg"
        print("FILE PATH:")
        print(filePath)
        imageView.image = UIImage(named: filePath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

