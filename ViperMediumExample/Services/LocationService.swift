//
//  LocationService.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit
import CoreLocation

class LocationService: NSObject {
    
    private var locationManager: CLLocationManager!
    var locationDatas: ((CLLocation)->())?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func verifyOrAskForLocationPermission(completion: @escaping (Bool) -> ()) {
    
        switch locationAuthorizationStatus() {
        case .notDetermined:
            completion(false)
            getPermissionLocation()
        case .denied, .restricted:
            completion(false)
            showPopUp()
        case .authorized:
            completion(true)
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            completion(true)
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            completion(true)
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    private func locationAuthorizationStatus() -> CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    private func getPermissionLocation() {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func forwardToAppSettings() {
        DispatchQueue.main.async {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    private func showPopUp() {
        let action = UIAlertAction(title: "Ayarlara Git", style: .default) { _ in
            self.forwardToAppSettings()
        }
        let alertVC = UIAlertController(title: "Konum bilgisine ulasilamiyor", message: "Konum bilgisine erisimi ayarlar uzerinden acabilirsiniz.", preferredStyle: .alert)
        alertVC.addAction(action)
        UIApplication.getPresentedViewController()?.present(alertVC, animated: true, completion: nil)
    }
}

//MARK: Core Location Delegate

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationDatas?(location)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        verifyOrAskForLocationPermission { _ in }
    }
}
