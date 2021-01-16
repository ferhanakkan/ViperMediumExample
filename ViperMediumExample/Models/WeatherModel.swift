//
//  WeatherModel.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import Foundation

struct WeatherModel: Codable {
    let base: String?
    let main: Main?
    let visibility: Int?
    let dt: Int?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}


