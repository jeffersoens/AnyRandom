//
//  LotteryViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 02.12.2022.
//

import UIKit

class LotteryViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var countTF: UITextField!
    @IBOutlet var minimumTF: UITextField!
    @IBOutlet var maximumTF: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var copyButton: UIButton!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        titleLabel.text = ""
        copyButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
    
    @IBAction func generateButtonTapped() {
        
        if minimumTF.text!.isEmpty && maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите границы диапазона",
                actionTitle: "ОК"
            )
            return
        }
        
        if minimumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите минимальное значение",
                actionTitle: "ОК"
            )
            return
        }
        
        if maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите максимальное значение",
                actionTitle: "ОК"
            )
            return
        }
        
        if countTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите необходимое количество результатов",
                actionTitle: "ОК")
            return
        }
        
        let minimumNumber = Int(minimumTF.text ?? "") ?? 0
        let maximumNumber = Int(maximumTF.text ?? "") ?? 0
        let countOfGroup = Int(countTF.text ?? "") ?? 1
        
        if countOfGroup < 1 {
            showAlert(
                title: "Неверное количество",
                message: "Количество результатов должно равнятся минимум одному",
                actionTitle: "ОК")
            countTF.text = ""
            return
        }
        
        if countOfGroup > maximumNumber {
            showAlert(
                title: "Неверное количество",
                message: "Количество результатов не может быть больше максимального уровня диапазона",
                actionTitle: "ОК")
            countTF.text = ""
            return
        }
        
        if minimumNumber < maximumNumber {
            var numbers = [Int]()
            for _ in 1...countOfGroup {
                numbers.append(Int.random(in: minimumNumber...maximumNumber))
            }
            resultLabel.text = (numbers.map { $0.description }).formatted()
            titleLabel.text = "Итог:"
            copyButton.isHidden = false
        } else {
            showAlert(
                title: "Неверный диапазон",
                message: "Максимальное значение не может быть меньше минимального",
                actionTitle: "ОK"
            )
            minimumTF.text = ""
            countTF.text = ""
            copyButton.isHidden = true
            resultLabel.text = ""
            titleLabel.text = ""
        }
        view.endEditing(true)
    }
} 
