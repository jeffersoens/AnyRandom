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
    
//MARK: - Private Properties
    private var minimumNumber = 0
    private var maximumNumber = 0
    private var countOfGroup = 0
    
    private let pasteboard = UIPasteboard.general
    
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
    
    @IBAction func copyFromAnswerLabel() {
        //copyText(for: answerLabel) Раскомментить
    }
    
    @IBAction func getNumbers() {
        titleLabel.text = "Итог:"
        copyButton.isHidden = false
        //answerLabel.text = getArray().formatted()
    }
      
//MARK: - Private Methods
    /*
    private func getArray() -> [String] {
        minimumNumber = Int(minimumTextField.text ?? "") ?? 0
        maximumNumber = Int(maximumTextField.text ?? "") ?? 0
        countOfGroup = Int(countTextField.text ?? "") ?? 1
        
        if minimumNumber < maximumNumber {
            var numbers = [Int]()
            for _ in 1...countOfGroup {
                numbers.append(Int.random(in: minimumNumber...maximumNumber))
            }
        } else {
            /* Раскомментить
            showAlert(
                title: "Упс... Ошибочка",
                message: "Похоже Вы вышли за рамки границ",
                actionTitle: "Ок"
            )
            minimumTextField.text = ""
            maximumTextField.text = ""
            countTextField.text = ""
            copyButton.isHidden = true
            */
        }
        
        //let array = numbers.map { $0.description }
        //return "[array]"
    }
    */
}
