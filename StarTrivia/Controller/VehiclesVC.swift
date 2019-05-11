//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    
    
    @IBOutlet weak var vhnameLabel: UILabel!
    @IBOutlet weak var vhmodelLabel: UILabel!
    @IBOutlet weak var vhmanufLabel: UILabel!
    @IBOutlet weak var vhcostLabel: UILabel!
    @IBOutlet weak var vhlengthLabel: UILabel!
    @IBOutlet weak var vhspeedLabel: UILabel!
    @IBOutlet weak var vhcrewLabel: UILabel!
    @IBOutlet weak var vhpassengLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var person: Person!
    var vehicle: Vehicle!
    var vehicleApi = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicles
        previousButton.isEnabled = false
        nextButton.isEnabled = vehicles.count > 1 // true if more than 1 item in array
        guard let firstVehicleUrl = person.vehicles.first else { return }
        getVehicle(url: firstVehicleUrl)
    }
    
    func getVehicle(url: String) {
        vehicleApi.getVehicle(url: url) { (res) in
            switch res {
            case .success(let vehicle):
                self.setupView(vehicle: vehicle)
                self.vehicle = vehicle
            case .failure(let err):
                print("Failed to fetch vehicle:", err)
            }
        }
    }
    
    
    func setupView(vehicle: Vehicle) {
        vhnameLabel.text = vehicle.name
        vhmodelLabel.text = vehicle.model
        vhmanufLabel.text = vehicle.manufacturer
        vhcostLabel.text = vehicle.cost_in_credits
        vhlengthLabel.text = vehicle.length
        vhspeedLabel.text = vehicle.max_atmosphering_speed
        vhcrewLabel.text = vehicle.crew
        vhpassengLabel.text = vehicle.passengers
        
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextButton.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousButton.isEnabled = currentVehicle == 0 ? false : true
        
//        if currentVehicle == 0 {
//            previousButton.isEnabled = false
//        } else {
//            previousButton.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextButton.isEnabled = false
//        } else {
//            nextButton.isEnabled = true
//        }
        
        getVehicle(url: vehicles[currentVehicle])
    }
}

