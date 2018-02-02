//
//  ViewController.swift
//  Memorable Places
//
//  Created by Lakshay Chhabra on 02/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let uilpr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureReco:)))
        
        uilpr.minimumPressDuration = 1
        map.addGestureRecognizer(uilpr)
        
        if activePlace == -1 {
            
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
            
            
        }
        else{
            // Get place Details details on map
            if places.count > activePlace{
            
                if let name = places[activePlace]["name"]{
                    if let lat = places[activePlace]["lat"] {
                        if let lon = places[activePlace]["lon"] {
                            if let latitude = Double(lat) {
                                if let longitude = Double(lon){
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let  region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotations = MKPointAnnotation()
                                    annotations.coordinate = coordinate
                                    annotations.title = name
                                    self.map.addAnnotation(annotations)
                                     
                                }
                            }
                        }
                    }
                    
                }
                
            }
        
        }
    
        
        
    }
    
    @objc func longpress(gestureReco : UIGestureRecognizer){
        
     
        if gestureReco.state == UIGestureRecognizerState.began{
                let touchpoint = gestureReco.location(in: self.map)
                let newCoordinate = self.map.convert(touchpoint, toCoordinateFrom: self.map)
                print(newCoordinate)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            var title = ""
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                
                if error != nil {
                    print(error!)
                    }
                else
                {
                    if let placemark = placemarks?[0] {
                        
                        if placemark.subThoroughfare != nil {
                            
                            title += placemark.subThoroughfare! + ""
                        }
                        if placemark.thoroughfare != nil {
                            
                            title += placemark.thoroughfare! + ""
                        }
                        
                    }
                }
                if title == "" {
                    title = "Added \(NSDate())"
                }
                
                let annotations = MKPointAnnotation()
                annotations.coordinate = newCoordinate
                annotations.title = "Temp Name"
                self.map.addAnnotation(annotations)
                
                places.append(["name":title, "lat": String(newCoordinate.latitude),"lon": String(newCoordinate.longitude) ])
                 UserDefaults.standard.set(places, forKey: "places")
            })
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
      
        let region = MKCoordinateRegion(center: location, span: span)
        self.map.setRegion(region, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

