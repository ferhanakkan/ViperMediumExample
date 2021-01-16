//
//  LocationProtocol.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit
import CoreLocation

//MARK: Router
protocol LocationRouterProtocol: class {
    func showWeatherDetails(location: CLLocation)
}

//MARK: Presenter

protocol LocationPresenterProtocol: class {
    var interactor: LocationInteractorInputProtocol! { get set }
    func viewDidAppear()
    func showWeatherButtonPressed()
}

//MARK: Interactor

// Interactor -> Presenter
protocol LocationInteractorOutputProtocol: class {
    func usersLocation(location: CLLocation)
    func locationPermissionVerified()
}

// Presenter -> Interactor

protocol LocationInteractorInputProtocol: class {
    var presenter: LocationInteractorOutputProtocol! { get set }
    func verifyLocationPermission()
    func getUsersLocation()
}

//MARK: View

protocol LocationViewProtocol: class {
    var presenter: LocationPresenterProtocol! { get set }
    func showWeaterButton()
}
