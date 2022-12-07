//
//  RandomWordViewController.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 07.12.2022.
//

import UIKit

class RandomWordViewController: UIViewController {
    
    
    @IBOutlet weak var wordsLabel: UITextField!
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var copyButton: UIButton!
    
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
    
    
    @IBAction func randomWordButtonTapped() {
        
        var words: [String] = wordsLabel.text?.components(separatedBy: ",") ?? []
        
        if wordsLabel.text!.isEmpty {
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
        
        let words: [String] = wordsLabel.text?.components(separatedBy: ",") ?? []
        
        if wordsLabel.text!.isEmpty {
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
