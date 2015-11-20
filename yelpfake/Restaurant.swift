//
//  Restaurants.swift
//  yelpfake
//
//  Created by sung on 11/20/15.
//  Copyright © 2015 Paul Kwon. All rights reserved.
//

import MapKit

class Restaurant: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let foodType: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, foodType: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.foodType = foodType
        self.coordinate = coordinate
        
        super.init()
    }
    var subtile: String?{
        return locationName
    }
}
