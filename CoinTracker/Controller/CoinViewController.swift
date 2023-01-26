//
//  ViewController.swift
//  CoinTracker
//
//  Created by Fredy Sanchez on 22/01/23.
//

import UIKit

class CoinViewController: UIViewController {
    
    var coinPriceView: CoinPriceView!
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinPriceView = CoinPriceView()
        self.view.addSubview(coinPriceView)
        coinPriceView.autoPinEdgesToSuperviewEdges()
        
        coinPriceView.currencySelector.dataSource = self
        coinPriceView.currencySelector.delegate = self
        coinManager.delegate = self
    }
}

extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    // Number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let currency = coinManager.getCurrency(for: row) {
            coinPriceView.currencyLabel.text = currency
            coinManager.getCoinPrice(for: currency)
        }
    }
}

extension CoinViewController: CoinManagerDelegate {
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    func didUpdateCoinPrice(_ manager: CoinManager, coinPrice: Double) {
        DispatchQueue.main.async {
            self.coinPriceView.priceLabel.text = String(format: "%.4f", coinPrice)
        }
    }
}
