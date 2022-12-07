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
        copyText(for: answerLabel)
    }
    
    @IBAction func getRandomNumber() {
        copyButton.isHidden = false
        
        let minimumNumber = Int(minimumTextField.text ?? "") ?? 100
        let maximumNumber = Int(maximumTextField.text ?? "") ?? 0
        
        if minimumNumber <= maximumNumber {
            answerLabel.text = Int.random(in: minimumNumber...maximumNumber).formatted()
        } else {
            showAlert(
                title: "Неверный диапазон",
                message: "Проверьте корректность введённого диапазона",
                actionTitle: "Ок"
            )
            minimumTextField.text = ""
            maximumTextField.text = ""
            answerLabel.text = ""
            copyButton.isHidden = true
        }
    }
}
