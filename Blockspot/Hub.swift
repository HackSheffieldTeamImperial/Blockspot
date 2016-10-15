//
//  Hub.swift
//  Blockspot
//
//  Created by Alessandro Bonardi on 15/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Foundation
import MapKit

class Hub {
    
    var radius: Double
    var location: CLLocationCoordinate2D
    var name: String
    
    init (radius: Double, location: CLLocationCoordinate2D, name: String) {
        self.radius = radius
        self.location = location
        self.name = name
    }
    
}
