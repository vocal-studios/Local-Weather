//
//  WeatherCell.swift
//  Local Weather
//
//  Created by Amy on 9/7/17.
//  Copyright © 2017 Vocal Studios. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    func configureCell(Forecast: forecast) {
        lowTempLbl.text = "\(Forecast.lowTemp)"
        highTempLbl.text = "\(Forecast.highTemp)"
        weatherTypeLbl.text = Forecast.weatherType
        dayLbl.text = Forecast.date
        weatherIcon.image = UIImage(named: Forecast.weatherType)
    }

}
