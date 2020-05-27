//
//  UIViewController+Alerts.swift
//  TestCats
//
//  Created by Максим Чесников on 26.05.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
