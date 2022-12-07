//
//  TimeViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class TimeViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var minimumTF: UITextField!
    @IBOutlet var maximumTF: UITextField!
    
    @IBOutlet var copyButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        copyButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IB Actions
    
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
    
    @IBAction func generateButtonTapped() {
        
        if minimumTF.text!.isEmpty && maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите минимальное и максимальное время",
                actionTitle: "ОК"
            )
            return
        }
        
        if minimumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите минимальное время",
                actionTitle: "ОК"
            )
            return
        }
        
        if maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите максимальное время",
                actionTitle: "ОК"
            )
            return
        }
        
        copyButton.isHidden = false
        
        let minimumNumber = Int(minimumTF.text ?? "") ?? 0
        let maximumNumber = Int(maximumTF.text ?? "") ?? 24
        
        if minimumNumber < maximumNumber {
            
            let hour = Int.random(in: minimumNumber..<maximumNumber)
            let minute = Int.random(in: 0...59)
            
            if hour >= 0 && hour <= 23 {
                if hour <= 9 {
                    (minute <= 9) ? (resultLabel.text = "0\(hour):0\(minute)") : (resultLabel.text = "0\(hour):\(minute)")
                } else {
                    (minute <= 9) ? (resultLabel.text = "\(hour):0\(minute)") : (resultLabel.text = "\(hour):\(minute)")
                }
            } else {
                showAlert(
                    title: "Неверный диапазон",
                    message: "Проверьте корректность введённого диапазона",
                    actionTitle: "ОK"
                )
                hideElements()
            }
        } else {
            showAlert(
                title: "Неверный диапазон",
                message:"Похоже, Вы перепутали границы местами",
                actionTitle: "ОK"
            )
            
            hideElements()
        }
        view.endEditing(true)
    }
    
    //MARK: - Private Methods
    
    private func hideElements() {
        minimumTF.text = ""
        maximumTF.text = ""
        resultLabel.text = ""
        copyButton.isHidden = true
    }
}
