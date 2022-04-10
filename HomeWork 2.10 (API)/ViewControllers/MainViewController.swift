//
//  MainViewController.swift
//  HomeWork 2.10 (API)
//
//  Created by Алексей Синяговский on 08.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var btcLabel: UILabel!
    @IBOutlet var usdLabel: UILabel!
    @IBOutlet var lastUpdatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData()
        
        _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        
    }
    
    @objc func refreshData() -> Void {
        NetworkManager.shared.fetchData()
    }
    
     func setPrices(currency: Currency) {
        DispatchQueue.main.async {
            self.btcLabel.text = self.formatPrice(currency.btc)
            self.usdLabel.text = self.formatPrice(currency.usd)
            self.lastUpdatedLabel.text = self.formatDate(date: Date())
        }
    }
    
    func formatPrice(_ price: Price) -> String {
        return String(format: "%@ %.2f", price.unit, price.value)
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM y HH:mm:ss"
        return formatter.string(from: date)
    }
}
