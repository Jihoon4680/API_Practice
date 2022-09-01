//
//  ViewController.swift
//  KakaoAPI
//
//  Created by 안지훈 on 9/1/22.
//

import UIKit

class ViewController: UIViewController,MTMapViewDelegate {

    var mapView : MTMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView = MTMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
        
        
    }


}

