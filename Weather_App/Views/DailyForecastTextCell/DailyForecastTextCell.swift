//
//  DailyForecastTextCell.swift
//  Weather_App
//
//  Created by SheyZen on 13/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class DailyForecastTextCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!

    func configure(_ myCity: City?) {
        infoLabel.text = myCity?.forecast?.Summary_Daily
    }
    
}
