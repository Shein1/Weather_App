//
//  HourlyForecastTextCell.swift
//  Weather_App
//
//  Created by SheyZen on 12/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class HourlyForecastTextCell: UITableViewCell {
    @IBOutlet var hourlyText: UILabel!
    
    func configure(_ myCity: City?) {
        hourlyText.text = myCity?.forecast?.Summary_Hour
    }
}
