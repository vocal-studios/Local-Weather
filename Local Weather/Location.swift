//
//  Location.swift
//  Local Weather
//
//  Created by Amy on 9/7/17.
//  Copyright © 2017 Vocal Studios. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
