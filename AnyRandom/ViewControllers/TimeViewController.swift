//
//  TimeViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit
 
class TimeViewController: UIViewController {
    
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
    
//MARK: - IB Actions
    @IBAction func copyFromAnswerLabel() {
        copyText(for: answerLabel)
    }
    
    @IBAction func getTime() {
        copyButton.isHidden = false
        
        let minimumNumber = Int(minimumTextField.text ?? "") ?? 0
        let maximumNumber = Int(maximumTextField.text ?? "") ?? 24
        
        if minimumNumber < maximumNumber {
            let hour = Int.random(in: minimumNumber..<maximumNumber)
            let minute = Int.random(in: 0...59)
            if hour >= 0 && hour <= 23 {
                if hour <= 9 {
                    (minute <= 9) ? (answerLabel.text = "0\(hour):0\(minute)") : (answerLabel.text = "0\(hour):\(minute)")
                } else {
                    (minute <= 9) ? (answerLabel.text = "\(hour):0\(minute)") : (answerLabel.text = "\(hour):\(minute)")
                }
            } else {
                showAlert(
                    title: "Неверный диапазон",
                    message: "Проверьте корректность введённого диапазона",
                    actionTitle: "Ок"
                )
                hideElements()
            }
        } else {
            showAlert(
                title: "Неверный диапазон",
                message:"Похоже, Вы перепутали границы местами",
                actionTitle: "Ок"
            )
            hideElements()
        }
    }
    
//MARK: - Private Methods
    private func hideElements() {
        minimumTextField.text = ""
        maximumTextField.text = ""
        answerLabel.text = ""
        copyButton.isHidden = true
    }
}
