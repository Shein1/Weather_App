//
//  CityTableViewCell.swift
//  Weather_App
//
//  Created by SheyZen on 13/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    func config(_ city: City) {
        cityLabel.text = city.name
    }
    
}
