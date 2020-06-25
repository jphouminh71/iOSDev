//
//  WeatherData.swift
//  Clima
//
//  Created by Jonathan Phouminh on 6/15/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

/* have to create a separate struct because main is an object itself */
struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let id: Int
}
