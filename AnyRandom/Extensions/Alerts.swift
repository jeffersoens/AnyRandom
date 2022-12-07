//
//  Alerts.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 06.12.2022.
//

import UIKit

extension UIViewController {
    func copyText(for label: UILabel) {
        
        let pasteboard = UIPasteboard.general
        
        let alert = UIAlertController(title: "Готово!", message: "Результат скопирован", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .default) { _ in
            pasteboard.string = label.text
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
} 
