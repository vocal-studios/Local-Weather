//
//  Constants.swift
//  Local Weather
//
//  Created by Amy on 4/7/17.
//  Copyright © 2017 Vocal Studios. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let lat = "lat="
let lon = "&lon="
let APP_ID = "&appid="
let API_KEY = "edc8bd0014b690fac3b50d6254c10d5c"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(lat)31.9505\(lon)115.8605\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=31.9505&lon=115.8605&cnt=10&mode=json&appid=edc8bd0014b690fac3b50d6254c10d5c"

