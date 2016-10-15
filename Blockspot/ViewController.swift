//
//  ViewController.swift
//  Blockspot
//
//  Created by Alessandro Bonardi on 15/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController {
    
    
    @IBOutlet var mapView: MKMapView!
    
    var Hubs: [Hub]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = self.mapView.userLocation
        
        centerMapOnLocation(location: initialLocation)
        
        // Do any additional setup after loading the view.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: MKUserLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: MKMapViewDelegate {

}
