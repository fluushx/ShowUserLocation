//
//  ViewController.swift
//  Show User Location
//
//  Created by Felipe Ignacio Zapata Riffo on 11-08-21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet var mapView:MKMapView!
    
    let managaer = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        managaer.desiredAccuracy = kCLLocationAccuracyBest // use to much batery
        managaer.delegate = self
        managaer.requestWhenInUseAuthorization()
        managaer.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            managaer.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render (_ location: CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span  = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1
        )
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

