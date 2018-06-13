//
//  ExtraInfoTextCell.swift
//  Weather_App
//
//  Created by SheyZen on 13/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit

class ExtraInfoTextCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    func config(){
        titleLabel.text = "Extra Informations"
    }
    
}
