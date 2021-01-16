//
//  WeatherProtocol.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit

//MARK: Router
protocol WeatherRouterProtocol: class {
}

//MARK: Presenter

protocol WeatherPresenterProtocol: class {
    var interactor: WeatherInteractorInputProtocol! { get set }
    func viewDidApperar()
}

//MARK: Interactor

// Interactor -> Presenter
protocol WeatherInteractorOutputProtocol: class {
    func weatherDetails(weatherData: WeatherModel)
}

// Presenter -> Interactor

protocol WeatherInteractorInputProtocol: class {
    var presenter: WeatherInteractorOutputProtocol! { get set }
    func fetchWeatherDetails(latitude: Double, longitude: Double)
}

//MARK: View

protocol WeatherViewProtocol: class {
    var presenter: WeatherPresenterProtocol! { get set }
    func updateLabel(text: String)
}
