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

