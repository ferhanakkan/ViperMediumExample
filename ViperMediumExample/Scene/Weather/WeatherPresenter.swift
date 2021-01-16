//
//  WeatherPresenter.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import Foundation
import CoreLocation

class WeatherPresenter: NSObject {
    
    var view: WeatherViewProtocol!
    var interactor: WeatherInteractorInputProtocol!
    var router: WeatherRouterProtocol!

    private var location: CLLocation?
    
    init(location: CLLocation) {
        super.init()
        
        self.location = location
    }
}

extension WeatherPresenter: WeatherPresenterProtocol {
    func viewDidApperar() {
        interactor.fetchWeatherDetails(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    }
}

extension WeatherPresenter: WeatherInteractorOutputProtocol {
    func weatherDetails(weatherData: WeatherModel) {
        let temp = String(weatherData.main!.temp!-273)
        view.updateLabel(text: temp)
    }
}
