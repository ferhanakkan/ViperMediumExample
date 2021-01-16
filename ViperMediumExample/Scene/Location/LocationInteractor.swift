//
//  LocationInteractor.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import Foundation

class LocationInteractor {
    var presenter: LocationInteractorOutputProtocol!
    
    let locationService = LocationService()
}

extension LocationInteractor: LocationInteractorInputProtocol {
    func verifyLocationPermission() {
        locationService.verifyOrAskForLocationPermission { result in
            if result {
                self.presenter.locationPermissionVerified()
            }
        }
    }
    
    func getUsersLocation() {
        locationService.locationDatas = { location in
            self.presenter.usersLocation(location: location)
        }
    }
}
