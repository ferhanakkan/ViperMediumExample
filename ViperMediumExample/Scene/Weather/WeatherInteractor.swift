//
//  WeatherInteractor.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import Foundation
import QuickApi

class WeatherInteractor {
    var presenter: WeatherInteractorOutputProtocol!
}

extension WeatherInteractor: WeatherInteractorInputProtocol {
    func fetchWeatherDetails(latitude: Double, longitude: Double) {
        Quick.shared.getRequest(endPoint: "weather?lat=\(latitude)&lon=\(longitude)&appid=ed8e95b99c3648b0730171a85d781078",
                                responseObject: WeatherModel.self) { responseWeather, error in
            if let error = error {
                print(error)
            } else {
                self.presenter.weatherDetails(weatherData: responseWeather!)
            }
        }
    }
}
