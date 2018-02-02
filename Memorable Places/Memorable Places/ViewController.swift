//
//  ViewController.swift
//  Memorable Places
//
//  Created by Lakshay Chhabra on 02/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if activePlace != -1 {
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
                                    self.map.addAnnotation(annotations )
                                     
                                }
                            }
                        }
                    }
                    
                }
                
            }
        
        }
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

