//
//  ViewController.swift
//  Location
//
//  Created by Sun on 26/10/2021.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    // MARK: - Property
    private let locationManager = LocationManager.shared
    
    // MARK: - Outlet
    override func viewDidLoad() {
        super.viewDidLoad()
        listenLocation()
    }
    
    // MARK: - Data
    private func listenLocation() {
        locationManager.passLocation = { [weak self] address, count in
            guard let self = self else { return }
            self.countLabel.text = "Count Calculation Adress = " + String(count)
            self.addressLabel.text = "address = \(address)"
        }
    }
}
