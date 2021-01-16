//
//  WeatherRouter.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit
import CoreLocation

class WeatherRouter {
    
    internal var controller: WeatherViewController!
    internal var presenter: WeatherPresenter!
    internal var interactor: WeatherInteractor!
    
    init(location: CLLocation) {
        interactor = WeatherInteractor()
        presenter = WeatherPresenter(location: location)
        controller = WeatherViewController()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = controller
        controller.presenter = presenter
    }
}

extension WeatherRouter: WeatherRouterProtocol {
 
}
