//
//  Hub.swift
//  Blockspot
//
//  Created by Alessandro Bonardi on 15/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Foundation

class Hub {
    
    var radius: Double
    var location: (Double, Double)
    var name: String
    
    init (radius: Double, location: (Double, Double), name: String) {
        self.radius = radius
        self.location = location
        self.name = name
    }
    
}
