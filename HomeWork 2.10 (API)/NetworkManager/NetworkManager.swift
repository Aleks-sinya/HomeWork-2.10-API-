//
//  NetworkManager.swift
//  HomeWork 2.10 (API)
//
//  Created by Алексей Синяговский on 08.04.2022.
//

import Foundation


class NetworkManager {
    
    class func fetchData(completion: @escaping(Rates) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let rates = try JSONDecoder().decode(Rates.self, from: data)
                completion(rates)
                print(rates)
            } catch let error {
                print(error)
                return
            }
        }.resume()
    }
    
    private init() {}
}
