//
//  numberViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class NumberViewController: UIViewController {
    
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
    
    // MARK: - IB Actions
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
    
    @IBAction func generateButtonTapped() {
        
        if minimumTF.text!.isEmpty && maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите диапазон",
                actionTitle: "ОК"
            )
            return
        }
        
        if minimumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите минимальное значение",
                actionTitle: "ОК"
            )
            return
        }
        
        if maximumTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите максимальное значение",
                actionTitle: "ОК"
            )
            return
        }
        
        copyButton.isHidden = false
        
        let minimumNumber = Int(minimumTF.text ?? "") ?? 100
        let maximumNumber = Int(maximumTF.text ?? "") ?? 0
        
        if minimumNumber <= maximumNumber {
            resultLabel.text = Int.random(in: minimumNumber...maximumNumber).formatted()
        } else {
            showAlert(
                title: "Неверный диапазон",
                message: "Максимальное значение не может быть меньше минимального значения",
                actionTitle: "ОK"
            )
            
            maximumTF.text = ""
            resultLabel.text = ""
            copyButton.isHidden = true
        }
        
        view.endEditing(true)
    }
} 
