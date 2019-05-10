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

    var person: Person!
    var vehicle: Vehicle!
    var vehicleApi = VehicleApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = person.vehicles[0]
        vehicleApi.getVehicle(url: url) { (res) in
            switch res {
            case .success(let vehicle):
               self.setupView(vehicle: vehicle)
                self.vehicle = vehicle
            case .failure(let err):
                print("Failed to fetch homeworld:", err)
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

}

