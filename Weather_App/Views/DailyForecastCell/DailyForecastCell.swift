//
//  DailyForecastCell.swift
//  Weather_App
//
//  Created by SheyZen on 13/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class DailyForecastCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var tempMin: UILabel!
    @IBOutlet var tempMax: UILabel!
    @IBOutlet var iconLabel: UIImageView!
    
    func configure(_ dailyForecast: DailyForecast?) {
        if let unix = dailyForecast?.UnixTime {
            let day = NSDate(timeIntervalSince1970: unix)
            let timePeriodFormatter = DateFormatter()
            timePeriodFormatter.dateFormat = "EEEE"
            let dayString = timePeriodFormatter.string(from: day as Date)
            dayLabel.text = "\(dayString)"
        }
        
        if let icon = dailyForecast?.Icon {
            iconLabel.image = UIImage(named: "\(icon)")
        }
        
        if let tempMaxValue = dailyForecast?.TemperatureMax{
            tempMax.text = "\(tempMaxValue)°C"
        }
        
        if let tempMinValue = dailyForecast?.TemperatureMin {
            tempMin.text = "\(tempMinValue)°C"
        }
        
    }
    
}
