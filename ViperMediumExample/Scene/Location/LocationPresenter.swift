//
//  LocationPresenter.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import Foundation
import CoreLocation

class LocationPresenter: NSObject {
    
    var view: LocationViewProtocol!
    var interactor: LocationInteractorInputProtocol!
    var router: LocationRouterProtocol!

    private var location: CLLocation?
    
    override init() {
        super.init()
    }
}

extension LocationPresenter: LocationPresenterProtocol {
    func viewDidAppear() {
        interactor.verifyLocationPermission()
    }
    
    func showWeatherButtonPressed() {
        router.showWeatherDetails(location: location!)
    }
}

extension LocationPresenter: LocationInteractorOutputProtocol {
    func locationPermissionVerified() {
        interactor.getUsersLocation()
    }
    
    func usersLocation(location: CLLocation) {
        self.location = location
        view.showWeaterButton()
    }
}
