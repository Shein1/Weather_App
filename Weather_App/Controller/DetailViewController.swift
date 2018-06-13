//
//  DetailViewController.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let key: String = "4980cbda2af1da55cb19c331e8f069db"
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = city?.name
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HeaderCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "headerCell")
        
        let nib1 = UINib(nibName: "HourlyForecastTextCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "hourlyForecastTextCell")
        
        let nib2 = UINib(nibName: "HourlyForecastCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "hourlyForecastCell")
        
        let nib3 = UINib(nibName: "DailyForecastTextCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "dailyForecastTextCell")
        
        let nib4 = UINib(nibName: "DailyForecastCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "dailyForecastCell")
        
        let nib5 = UINib(nibName: "ExtraInfoCell", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: "extraInfoCell")
        
        let nib6 = UINib(nibName: "ExtraInfoTextCell", bundle: nil)
        tableView.register(nib6, forCellReuseIdentifier: "extraInfoTextCell")
        
        requestDetails()
    }
    
    func requestDetails() {
        guard let coordinates = city?.coordinates else {return}
        let lat = coordinates.latitude
        let long = coordinates.longitude
        
        
        Alamofire.request("https://api.darksky.net/forecast/\(key)/\(lat),\(long)?units=si").responseJSON { response in
            if let data = response.result.value {
                let json = JSON(data)
                
                self.city?.forecast = Forecast(json)
                self.city?.forecast?.parsingDailyForecast(json)
                self.city?.forecast?.parsingHourlyForecast(json)
                
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 10
        case 3:
            return 1
        case 4:
            return 7
        case 5:
            return 1
        case 6:
            return 2
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            if let city = city {
                cell.configure(city)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyForecastTextCell", for: indexPath) as! HourlyForecastTextCell
            if let city = city {
                cell.configure(city)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyForecastCell", for: indexPath) as! HourlyForecastCell
            if let city = city {
                if let temp = city.forecast?.HourlyForecast {
                    cell.configure(temp[indexPath.row])
                }
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForecastTextCell", for: indexPath) as! DailyForecastTextCell
            if let city = city {
                cell.configure(city)
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForecastCell", for: indexPath) as! DailyForecastCell
            if let city = city {
                if let temp = city.forecast?.DailyForecasts {
                    cell.configure(temp[indexPath.row])
                }
            }
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "extraInfoTextCell", for: indexPath) as! ExtraInfoTextCell
            cell.config()
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "extraInfoCell", for: indexPath) as! ExtraInfoCell
            if let city = city {
                cell.configure((city.forecast?.ExtraInfo[indexPath.row])!)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
