//
//  ViewController.swift
//  Local Weather
//
//  Created by Amy on 3/7/17.
//  Copyright © 2017 Vocal Studios. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var Forecast: forecast!
    var forecasts = [forecast] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        
        currentWeather.downLoadWeatherDetails {
            self.downloadForecast {
                self.updateMainUI()
            }
        }
        
    }
    
    func downloadForecast(completed: @escaping DownloadComplete) {
        // download forecast for tableview
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let Forecast = forecast(weatherDict: obj)
                        self.forecasts.append(Forecast)
                        print(obj)
                    }
                }
            }
            completed()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        dateLbl.text = currentWeather.date
        tempLbl.text = "\(currentWeather.currentTemp)"
        currentWeatherLbl.text = currentWeather.weatherType
        locationLbl.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

