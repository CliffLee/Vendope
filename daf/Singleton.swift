//
//  Singleton.swift
//  daf
//
//  Created by Brian Ng on 10/4/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import Foundation
import Parse
import Bolts
import MapKit

private let _sharedInstance = Singleton()
class Singleton {
    private init() {
        
    }
    class var sharedInstance: Singleton {
        return _sharedInstance
    }
    
    var services:[PFObject] = []
    var results:[PFObject] = []
    var tblSearchResults:UITableView?
    var mapView:MKMapView?
}