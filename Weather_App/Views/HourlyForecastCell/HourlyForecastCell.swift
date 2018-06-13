//
//  HourlyForecastCell.swift
//  Weather_App
//
//  Created by SheyZen on 12/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class HourlyForecastCell: UITableViewCell {

    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    func configure(_ hourlyForecast: ForecastHourly?) {
        
        if let unix = hourlyForecast?.UnixTime {
            let hour = NSDate(timeIntervalSince1970: unix)
            let timePeriodFormatter = DateFormatter()
            timePeriodFormatter.dateFormat = "hh"
            let hourString = timePeriodFormatter.string(from: hour as Date)
            hourLabel.text = "\(hourString)"
        }
        
        if let icon = hourlyForecast?.Icon {
             iconImage.image = UIImage(named: "\(icon)")
        }
        
        if let temp = hourlyForecast?.Temperature {
            tempLabel.text = "\(temp)°C"
        }
        
        if let humidity = hourlyForecast?.Humidity {
            let trueHumidity = humidity * 100
            
            humidityLabel.text = "\(Int(trueHumidity))%"
        }
        
        
    }
    
}
