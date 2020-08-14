//
//  RestaurantAnnotation.swift
//  FoodMates
//
//  Created by Hiren Patel on 9/8/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import MapKit

class RestaurantAnnotations: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    //var image: UIImage? = nil

    init(title: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
    }
}
