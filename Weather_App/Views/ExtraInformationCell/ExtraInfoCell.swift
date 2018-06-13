//
//  ExtraInfoCell.swift
//  Weather_App
//
//  Created by SheyZen on 13/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class ExtraInfoCell: UITableViewCell {

    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    
    func configure(_ info: (String, String, String, String)) {
        titleLabel1.text = info.0
        infoLabel1.text = info.1
        
        titleLabel2.text = info.2
        infoLabel2.text = info.3
    }
    
}
