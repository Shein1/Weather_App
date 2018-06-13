//
//  HourlyForecast.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit
import SwiftyJSON

class DailyForecast {
    var UnixTime: Double
    var Icon: String
    var TemperatureMin: Int
    var TemperatureMax: Int
    
    
    init(_ Unixtime: Double, _ Icon : String, _ TemperatureMin: Int, _ TemperatureMax: Int) {
        self.UnixTime = Unixtime
        self.Icon = Icon
        self.TemperatureMin = TemperatureMin
        self.TemperatureMax = TemperatureMax
    }
}
