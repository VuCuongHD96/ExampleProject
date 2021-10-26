//
//  ViewController.swift
//  Location
//
//  Created by Sun on 26/10/2021.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var coordinateLabel: UILabel!
    
    // MARK: - Property
    private let locationManager = LocationManager.shared
    
    // MARK: - Outlet
    override func viewDidLoad() {
        super.viewDidLoad()
        listenLocation()
    }
    
    // MARK: - Data
    private func listenLocation() {
        locationManager.passLocation = { [weak self] location in
            guard let self = self else { return }
            self.coordinateLabel.text = "latitude = \(location.latitude) \nlongitude = \(location.longitude)"
        }
    }
}

