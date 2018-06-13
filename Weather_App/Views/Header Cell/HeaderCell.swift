//
//  HeaderCell.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func configure(_ myCity: City?) {
        if let temp = myCity?.forecast?.Temperature {
            tempLabel.text = "\(temp)°C"
        }
        summaryLabel.text = myCity?.forecast?.Summary
        if let is_Icon = myCity?.forecast?.Icon {
            iconImage.image = UIImage(named: "\(is_Icon)")
        }
    }
}
