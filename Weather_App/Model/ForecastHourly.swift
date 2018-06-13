//
//  ForecastHourly.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit
import SwiftyJSON

class ForecastHourly {
    var UnixTime: Double
    var Icon: String
    var Humidity: Double
    var Temperature: Int
    
    
    init(_ Unixtime: Double, _ Icon: String, _ Humidity: Double, _ Temperature: Int) {
        self.UnixTime = Unixtime
        self.Icon = Icon
        self.Humidity = Humidity
        self.Temperature = Temperature
    }
    
    
}
