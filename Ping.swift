//
//  Ping.swift
//  Found
//
//  Created by User on 12.11.16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation
import MapKit

class Pin: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    
    init(c: CLLocationCoordinate2D, title: String?) {
        self.coordinate = c
        self.title = title
    }
    
    var title: String?
}

//let latitude = mapView.userLocation.coordinate.latitude
//let longitude = mapView.userLocation.coordinate.longitude
//
//
//let pin = Pin(c
//    : mapView.userLocation.coordinate, title: "\(latitude); \(longitude)")
//mapView.addAnnotation(pin)

//self.width = 50
//self.height = 50
//self.mapViewHeight = 200
//self.mapViewWidth = 200
//print(self.mapViewHeight)
//print(self.mapViewWidth)
//if self.mapViewWidth > 94.503633 && self.mapViewHeight > 94.503633{
//    self.mapViewWidth = 94.5062
//    self.mapViewHeight = 94.503632
//    let span = MKCoordinateSpanMake(mapViewWidth, mapViewHeight)
//    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
//    let curRegion = MKCoordinateRegionMake(coordinate, span)
//    self.mapView.setRegion(curRegion, animated: true)
//}
//else{
//    self.scaleHeight = scaleHeight / 2
//    self.scaleWidth = scaleWidth / 2
//    
//    self.mapViewWidth = (self.width * scale + scaleWidth * scale)
//    self.mapViewHeight = (self.height * scale + scaleHeight * scale)
//    let span = MKCoordinateSpanMake(mapViewWidth, mapViewHeight)
//    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
//    let curRegion = MKCoordinateRegionMake(coordinate, span)
//    self.mapView.setRegion(curRegion, animated: true)
//}



//self.width = 50
//self.height = 50
//print(self.mapViewHeight)
//print(self.mapViewWidth)
//if self.mapViewWidth < 94.503633 && self.mapViewHeight < 94.503633  {
//    
//    self.scaleHeight = scaleHeight * 2
//    self.scaleWidth = scaleWidth * 2
//    
//    self.mapViewWidth = (self.width * scale + scaleWidth * scale)
//    self.mapViewHeight = (self.height * scale + scaleHeight * scale)
//    let span = MKCoordinateSpanMake(mapViewWidth, mapViewHeight)
//    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
//    let curRegion = MKCoordinateRegionMake(coordinate, span)
//    self.mapView.setRegion(curRegion, animated: true)
//    
//}
//else{
//    self.mapViewWidth = 165
//    self.mapViewHeight = 165
//    let span = MKCoordinateSpanMake(mapViewWidth, mapViewHeight)
//    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
//    let curRegion = MKCoordinateRegionMake(coordinate, span)
//    self.mapView.setRegion(curRegion, animated: true)
//}
