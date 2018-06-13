//
//  ViewController.swift
//  Weather_App
//
//  Created by SheyZen on 11/06/2018.
//  Copyright © 2018 SheyZen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuTable: UITableView!
    
    @IBAction func showMenu(_ sender: Any) {
        if !menuTable.isHidden {
            menuTable.isHidden = true
        } else {
            menuTable.isHidden = false
        }
    }
    
    var myCity: City?
    var cities: [City] = CitiesData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.dataSource = self
        mapView.delegate = self
        menuTable.isHidden = true
        
        
        for data in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.title = data.name
            pin.coordinate = data.coordinates
            mapView.addAnnotation(pin)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if let arg = view.annotation {
            myCity = City(name: arg.title!!, coordinates: arg.coordinate)
            performSegue(withIdentifier: "MapDetailSegue", sender: view)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapDetailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.city = myCity
            }
        }
        if segue.identifier == "fromMenuSegue" {
            if let vc = segue.destination as? DetailViewController, let index = menuTable.indexPathForSelectedRow?.row {
                vc.city = cities[index]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! CityTableViewCell
        cell.config(cities[indexPath.row])
        return cell
    }
    
}

