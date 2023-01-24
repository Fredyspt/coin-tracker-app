//
//  CoinAPIResponse.swift
//  CoinTracker
//
//  Created by Fredy Sanchez on 24/01/23.
//

import Foundation

/// Struct that replicates the JSON response structure from CoinAPI
struct CoinAPIResponse: Codable {
    let rate: Double
}
