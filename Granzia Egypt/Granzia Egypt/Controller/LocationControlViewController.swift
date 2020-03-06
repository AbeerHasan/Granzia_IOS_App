//
//  LocationControlViewController.swift
//  Granzia Egypt
//
//  Created by Abeer  on 11/15/18.
//  Copyright © 2018 Abeer . All rights reserved.
//

import UIKit
//import GoogleMaps
//import GooglePlaces
import WebKit
class LocationControlViewController: UIViewController{
    

    @IBOutlet weak var mapWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   mapView.settings.compassButton = true
     //   mapView.isMyLocationEnabled = true
    //    mapView.settings.myLocationButton = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mapWebView.load(URLRequest(url: URL(string: "https://goo.gl/maps/N6KrRKsyx2Gsnz3X9")! as URL))
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
