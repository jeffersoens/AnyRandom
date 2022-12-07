//
//  YesNoController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var questionTF: UITextField!
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiLabel.text = ""
        answerLabel.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IB Actions
    
    @IBAction func getAnswerButtonTapped() {
        
        if questionTF.text!.isEmpty {
            showAlert(
                title: "Введите вопрос",
                message: "Пожалуйста, введите вопрос, чтобы узнать, стоит ли вам...",
                actionTitle: "ОК"
            )
            return
        }
        
        let countOfAnswers = Int.random(in: 0...2)
        
        switch countOfAnswers {
        case 0:
            showAnswer(emoji: Emoji.yes.rawValue, describe: Emoji.yes.describe)
        case 1:
            showAnswer(emoji: Emoji.no.rawValue, describe: Emoji.no.describe)
        default:
            showAnswer(emoji: Emoji.dontKnow.rawValue, describe: Emoji.dontKnow.describe)
        }
        
        view.endEditing(true)
    }
    
    //MARK: - Private Methods
    
    private func showAnswer(emoji: Character, describe: String) {
        
        var question = questionTF.text?.lowercased() ?? ""
        
        if let questionMark = question.firstIndex(of: "?") {
            question.remove(at: questionMark)
        }
        
        emojiLabel.text = "\(emoji)"
        
        if emoji == Emoji.dontKnow.rawValue {
            answerLabel.text = describe
        } else {
            answerLabel.text = describe + question
        }
        
    }
}

// MARK: - Text Field Delegate

extension QuestionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == questionTF {
            getAnswerButtonTapped()
            view.endEditing(true)
        }
        return false
    }
}
