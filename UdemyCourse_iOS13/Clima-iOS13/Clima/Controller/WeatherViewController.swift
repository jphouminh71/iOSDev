//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.

// API KEY: 0b51d16e36fbdfa514fb90ef7f820377
// api.openweathermap.org/data/2.5/weather?q={city name}&appid={your api key}&units=imperial

import UIKit
import CoreLocation

class WeatherViewController: UIViewController{
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    /* setting up the text field outlets */
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    // core location package
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // prompts the user to ask for permission to get location
        locationManager.requestLocation()
        
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        // i want to trigger the function so that i can get the weathermanager to fetch me the current location weather
        locationManager.requestLocation()
        
    }
}
//MARK: - CLLManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate{
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(forLatitude: lat, forLongitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    /* this tells the view controller that the text field pressed the return button */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)  // this is how we dismiss the keyboard
        return true
    }
    
    /* the bool return tells the view controller if we should run the code block */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        /* the text field here is referring to the triggered TextFieldObject */
        if (textField.text! != ""){
            return true
        }else{
            textField.placeholder = "type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //searchTextField.text = searchTextField.placeholder
        let city = searchTextField.text
        weatherManager.fetchWeather(fromCity: city!)
        
        //        if let city: String = searchTextField.text{
        //            weatherManager.fetchWeather(fromCity: city)
        //        }
        
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

