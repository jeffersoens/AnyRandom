//
//  LotteryViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 02.12.2022.
//

import UIKit

class LotteryViewController: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet var countTextField: UITextField!
    @IBOutlet var minimumTextField: UITextField!
    @IBOutlet var maximumTextField: UITextField!
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var copyButton: UIButton!
    
// MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        titleLabel.text = ""
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
    
    @IBAction func getNumbers() {
        let minimumNumber = Int(minimumTextField.text ?? "") ?? 0
        let maximumNumber = Int(maximumTextField.text ?? "") ?? 0
        let countOfGroup = Int(countTextField.text ?? "") ?? 1
        
        if minimumNumber < maximumNumber {
            var numbers = [Int]()
            for _ in 1...countOfGroup {
                numbers.append(Int.random(in: minimumNumber...maximumNumber))
            }
            answerLabel.text = (numbers.map { $0.description }).formatted()
            titleLabel.text = "Итог:"
            copyButton.isHidden = false
        } else {
            showAlert(
                title: "Неверный диапазон",
                message: "Проверьте корректность введённого диапазона",
                actionTitle: "Ок"
            )
            minimumTextField.text = ""
            maximumTextField.text = ""
            countTextField.text = ""
            copyButton.isHidden = true
            answerLabel.text = ""
            titleLabel.text = ""
        }
    }
}
