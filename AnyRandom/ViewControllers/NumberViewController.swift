//
//  numberViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class NumberViewController: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet var minimumTextField: UITextField!
    @IBOutlet var maximumTextField: UITextField!
    
    @IBOutlet var copyButton: UIButton!
    
    @IBOutlet var answerLabel: UILabel!
    
// MARK: - Private Properties
    private let pasteboard = UIPasteboard.general
    
// MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        copyButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
// MARK: - IB Actions
    @IBAction func copyFromAnswerLabel() {
        //copyText(for: answerLabel) Раскомментить
    }
    
    @IBAction func getRandomNumber() {
        copyButton.isHidden = false
        let minimumNumber = Int(minimumTextField.text ?? "") ?? 100
        let maximumNumber = Int(maximumTextField.text ?? "") ?? 0
        
        if minimumNumber <= maximumNumber {
            answerLabel.text = Int.random(in: minimumNumber...maximumNumber).formatted()
        } else {
        }
    }
    
}

extension NumberViewController {
    private func showAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default) { _ in
            self.minimumTextField.text = ""
            self.maximumTextField.text = ""
            self.copyButton.isHidden = true
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}
