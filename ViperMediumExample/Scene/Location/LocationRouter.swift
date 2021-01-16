//
//  LocationRouter.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit
import CoreLocation

class LocationRouter {
    
    internal var controller: LocationViewController!
    internal var presenter: LocationPresenter!
    internal var interactor: LocationInteractor!
    
    init() {
        interactor = LocationInteractor()
        presenter = LocationPresenter()
        controller = LocationViewController()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = controller
        controller.presenter = presenter
    }
}

extension LocationRouter: LocationRouterProtocol {
    func showWeatherDetails(location: CLLocation) {
        let vc = WeatherRouter(location: location).controller
        controller.show(vc!, sender: nil)
    }
}
