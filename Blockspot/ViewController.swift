//
//  ViewController.swift
//  Blockspot
//
//  Created by Alessandro Bonardi on 15/10/2016.
//  Copyright © 2016 Alessandro Bonardi. All rights reserved.
//

import Cocoa
import MapKit

let WorkSpaces: [WorkSpace] = [WorkSpace.init(radius: 200.0, location: CLLocationCoordinate2D(latitude: 53.38163472317644,
                                                                            longitude: -1.4817873210134975), name: "Test1"),
                   WorkSpace.init(radius: 100.0, location: CLLocationCoordinate2D(latitude: 53.3763472317644,
                                                                            longitude: -1.483873210134975), name: "Test2")]



class ViewController: NSViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 500

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        if status == .restricted || status == .denied {
            return
        }
        
        self.mapView.delegate = self
        self.mapView.showsBuildings = true
        //locationManager.startUpdatingLocation()
        //self.mapView.showsUserLocation = true
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //centerMapOnLocation(location: locationManager.location!)
        
        
        drawCircles()
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(
            location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorized, .authorizedWhenInUse:
            manager.startUpdatingLocation()
            self.mapView.showsUserLocation = true
            centerMapOnLocation(location: manager.location!)
        default:
            break
        }
        
    }
    
    func drawCircles() {
        for workSpace in WorkSpaces {
            print("bubu")
            let circleOverlay = MKCircle(center: workSpace.location, radius: workSpace.radius)
            mapView.add(circleOverlay)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = NSColor.red
        circleRenderer.alpha = 0.1
        return circleRenderer
    }
 
    override func mouseUp(with event: NSEvent) {
        let clickPoint = event.locationInWindow
        let clickCoordinate = mapView.convert(clickPoint, toCoordinateFrom: mapView)
        let mapRect = MKMapRectMake(clickCoordinate.latitude, clickCoordinate.longitude, 1, 1)
        print("inside")
        for circle in mapView.overlays as! [MKCircle] {
            if circle.intersects(mapRect) {
                print("OLE!!!")
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //self.mapView.centerCoordinate = (userLocation.location?.coordinate)!
        //centerMapOnLocation(location: self.mapView.userLocation.location!)

    }
}
