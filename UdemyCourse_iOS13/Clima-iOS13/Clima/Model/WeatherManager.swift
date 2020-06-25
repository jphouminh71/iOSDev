//
//  WeatherMangaer.swift
//  Clima
//
//  Created by Jonathan Phouminh on 6/15/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//
import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}


/* we only want to use a class when we need to use something involving objective-C or need inheritance */
struct WeatherManager{
    let weatherURL: String =
        "https://api.openweathermap.org/data/2.5/weather?units=Imperial&appid=0b51d16e36fbdfa514fb90ef7f820377"
    
    // the type of this is a protocol
    var delegate: WeatherManagerDelegate?
    
    
    /* should be returning a json string */
    func fetchWeather(fromCity cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    /* this will be called when reciving data from device location */
    func fetchWeather(forLatitude lat: CLLocationDegrees, forLongitude lon: CLLocationDegrees){
        let urlString: String = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
 
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                }
                
                if let safeData = data {
                    if let weather: WeatherModel = self.parseJSON(safeData) {
                        //self.delegate?.didUpdateWeather(weather: weather)
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            task.resume()  // have to type this to actually fire the task
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
    
}
