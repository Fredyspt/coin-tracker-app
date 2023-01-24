//
//  CoinManager.swift
//  CoinTracker
//
//  Created by Fredy Sanchez on 23/01/23.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ error: Error)
    func didUpdateCoinPrice(_ manager: CoinManager, coinPrice: Double)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    private var apiKey: String? = {
        var apiPlistDict: [String: Any]?
        guard let plistPath = Bundle.main.url(forResource: "CoinAPI-Info", withExtension: "plist") else {
            print("Could find CoinAPI-Info.plist file!")
            return String()
        }
        
        do {
            let apiPlistData = try Data(contentsOf: plistPath)
            if let dict = try PropertyListSerialization.propertyList(from: apiPlistData, options: [], format: nil) as? [String: Any] {
                apiPlistDict = dict
            }
        } catch {
            print(error)
        }
        
        return apiPlistDict?["API_KEY"] as? String
    }()
    
    /// Get the currency name string at the given row
    func getCurrency(for currencyRow: Int) -> String? {
        return currencyArray[currencyRow]
    }
    
    /// Create URL for CoinAPI request and performs the request.
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apiKey=\(apiKey!)"
        perfomRequest(for: url)
    }
    
    /// Perform a GET request from the given urlString
    func perfomRequest(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                self.delegate?.didFailWithError(error) // inform the delegate of an error
                return
            }
            
            guard let priceData = data else { return } // make sure that we got data from the request
            
            // attempt parsing the data into a swift struct
            if let coinPriceData = self.parseJSON(from: priceData) {
                self.delegate?.didUpdateCoinPrice(self, coinPrice: coinPriceData.rate)
            }
        }
        task.resume()
    }
    
    /// Decode JSON response from a Data object into an instance of CoinAPIResponse
    func parseJSON(from priceData: Data) -> CoinAPIResponse? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinAPIResponse.self, from: priceData)
            return decodedData
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
