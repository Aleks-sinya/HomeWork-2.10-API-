//
//  NetworkManager.swift
//  HomeWork 2.10 (API)
//
//  Created by Алексей Синяговский on 08.04.2022.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    
    func fetchData() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if(error != nil) {
                print(error!)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                let getPrices = MainViewController()
                getPrices.setPrices(currency: json.rates)
            } catch let error {
                print(error)
                return
            }
        }.resume()
    }
}
