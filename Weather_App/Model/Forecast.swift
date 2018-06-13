//
//  Forecast.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forecast {
    var Temperature : Int
    var Icon : String
    var Summary : String
    var Summary_Hour: String
    var Summary_Daily: String
    var Windspeed : Int
    var Pressure : Double
    var Humidity : Double
    var UVIndex : Int
    var DailyForecasts : [DailyForecast] = []
    var HourlyForecast : [ForecastHourly] = []
    var ExtraInfo: [(String, String, String, String)] = []
    
    init(_ json: JSON) {
        self.Temperature = json["currently"]["temperature"].intValue
        self.Icon = json["currently"]["icon"].stringValue
        self.Summary = json["currently"]["summary"].stringValue
        self.Windspeed = json["currently"]["windSpeed"].intValue
        self.Pressure = json["currently"]["pressure"].doubleValue
        self.UVIndex = json["currently"]["uvIndex"].intValue
        self.Humidity = (json["currently"]["humidity"].doubleValue * 100)
        self.Summary_Hour = json["hourly"]["summary"].stringValue
        self.Summary_Daily = json["daily"]["summary"].stringValue
        self.ExtraInfo.append(("Humidity", "\(Humidity) %", "Windspeed", "\(Windspeed) km/h"))
        self.ExtraInfo.append(("Pressure", "\(Pressure) hPa", "UV Index", "\(UVIndex)"))
    }
    
    func parsingHourlyForecast(_ json: JSON) {
        for item in json["hourly"]["data"].arrayValue {
            HourlyForecast.append(ForecastHourly(item["time"].doubleValue,item["icon"].stringValue, item["humidity"].doubleValue, item["temperature"].intValue))
        }
        
    }
    
    func parsingDailyForecast(_ json: JSON) {
        for item in json["daily"]["data"].arrayValue {
            DailyForecasts.append(DailyForecast(item["time"].doubleValue,item["icon"].stringValue, item["temperatureMin"].intValue, item["temperatureMax"].intValue))
        }
    }
    
    func parsingExtraInfo(_ json: JSON) {
        
    }
    
}

