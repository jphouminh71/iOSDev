//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinExchange(_ coinManager: CoinManager, _ coinModel: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    // example of a completed request;  https://rest.coinapi.io/v1/exchangerate/BTC/USD/?apikey=28CE54D1-7857-44A3-80B8-C78942B615DC
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "28CE54D1-7857-44A3-80B8-C78942B615DC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    /* our goal is just to get the current exchange rate for the given currencyType in bitcoins */
    func getCoinPrice(for currency: String) {
        let urlString: String = baseURL + "/\(currency)/" + "?apikey=\(apiKey)"
        performRequest(urlString)
    }
    
    // THIS IS THE FUNCTION THAT ACTUALLY DOES THE NETWORK REQUEST
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data{
                    if let coin: CoinModel = self.parseJSON(safeData){
                        self.delegate?.didUpdateCoinExchange(self, coin)
                    }
                }
            }
            task.resume()  // have to type this to actually fire the task
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData: CoinData = try decoder.decode(CoinData.self, from: coinData)
            
            // upto this point, all the decoded data is in the object we just created
            // now we want to a coinModel object so we can send it up to the viewController
            
            let asset_id_base: String = decodedData.asset_id_base  // type of coin
            let asset_id_quote: String = decodedData.asset_id_quote  // exchange rate
            let rate: Double = decodedData.rate
            return CoinModel(asset_ed_base: asset_id_base, asset_id_quote: asset_id_quote, rate: rate)
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
    
    

    
}
