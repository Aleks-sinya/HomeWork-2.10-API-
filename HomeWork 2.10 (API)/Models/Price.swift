//
//  Price.swift
//  HomeWork 2.10 (API)
//
//  Created by Алексей Синяговский on 08.04.2022.
//

import Foundation

struct Currency: Codable {
    
    let btc: Price
    let usd: Price
    
}

struct Price: Codable {
    
    let name: String
    let unit: String
    let value: Double
    let type: String
}

struct Rates: Codable {
    
    let rates: Currency
}
