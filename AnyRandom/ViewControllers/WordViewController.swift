//
//  RandomWordViewController.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 07.12.2022.
//

import UIKit

class WordViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var wordsTF: UITextField!
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var copyButton: UIButton!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTitleLabel.isHidden = true
        resultLabel.isHidden = true
        copyButton.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func randomWordButtonTapped() {
        
        var words: [String] = wordsTF.text?.components(separatedBy: ",") ?? []
        
        if wordsTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите набор слов",
                actionTitle: "ОК"
            )
        }
        
        words.shuffle()
        resultLabel.text = words.removeFirst()
        
        resultTitleLabel.isHidden = false
        resultLabel.isHidden = false
        copyButton.isHidden = false
        
    }
    
    
    @IBAction func shuffleWordsButtonTapped() {
        
        let words: [String] = wordsTF.text?.components(separatedBy: ",") ?? []
        
        if wordsTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, введите набор слов",
                actionTitle: "ОК"
            )
            return
        }
        
        if words.count < 2 {
            showAlert(
                title: "Нужно больше слов",
                message: "Введите больше одного слова",
                actionTitle: "ОК"
            )
            return
        }
        
        resultLabel.text = words.shuffled().formatted()
        
        resultTitleLabel.isHidden = false
        resultLabel.isHidden = false
        copyButton.isHidden = false
        
    }
    
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
}

// MARK: - Text Field Delegate

extension WordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case wordsTF:
            randomWordButtonTapped()
            view.endEditing(true)
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
