//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    /* IB Outlet Connections */
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource{
    /* protocol functions for UIPickerViewDataSource */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /* this tells us how many objects we want inside per scroll item */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension ViewController: UIPickerViewDelegate{
    /* method for loading in the pickerviews titles : UIPickerViewDelegate */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //when the user picks a new coin we want to update the UI based on the coins pick
        let selectedCoin: String = coinManager.currencyArray[row]
        let _: () = coinManager.getCoinPrice(for: selectedCoin)
    }
}

extension ViewController: CoinManagerDelegate{
    // Functions that are needed to conform to CoinManagerDelegate
       func didUpdateCoinExchange(_ coinManager: CoinManager, _ coinModel: CoinModel) {
           DispatchQueue.main.async {
               // update the UI here
               self.currencyLabel.text = coinModel.asset_id_quote
               self.bitcoinLabel.text = coinModel.getRate()
           }
       }
       
       func didFailWithError(_ error: Error) {
           // coming here meant that something went wrong with the JSON parsing
           print(error)
       }
}

