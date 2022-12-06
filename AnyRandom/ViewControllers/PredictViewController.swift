//
//  YesNoController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class PredictViewController: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet var quesionTextField: UITextField!
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var describeLabel: UILabel!
    
// MARK: - Life Cycles Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
     
    @IBAction func letKnowAnswer() {
        let countOfAnswers = Int.random(in: 0...2)
        switch countOfAnswers {
        case 0:
            showAnswer(emoji: Emoji.yes.rawValue, describe: Emoji.yes.describe)
        case 1:
            showAnswer(emoji: Emoji.no.rawValue, describe: Emoji.no.describe)
        default:
            showAnswer(emoji: Emoji.dontKnow.rawValue, describe: Emoji.dontKnow.describe)
        }
    }
    
    private func showAnswer(emoji: Character, describe: String) {
        emojiLabel.text = "\(emoji)"
        describeLabel.text = describe
    }
}
