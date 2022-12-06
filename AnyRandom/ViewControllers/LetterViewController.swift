//
//  ViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class LetterViewController: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet var languageChoseControl: UISegmentedControl!
    @IBOutlet var sizeChoseControl: UISegmentedControl!
    
    @IBOutlet var copyButton: UIButton!
    
    @IBOutlet var answerLabel: UILabel!
    
//MARK: - Private Properties
    private let pasteboard = UIPasteboard.general
    
// MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        copyButton.isHidden = true
    }
    
// MARK: - IB Actions
    @IBAction func copyFromAnswerLabel() {
        //copyText(for: answerLabel) Раскомментить
    }
    
    @IBAction func makeLetter() {
        copyButton.isHidden = false
        if languageChoseControl.selectedSegmentIndex == 0 {
            if sizeChoseControl.selectedSegmentIndex == 0 {
                answerLabel.text = String(randomLetter(in: Alphabet.russianCaps.rawValue))
            } else {
                answerLabel.text = String(randomLetter(in: Alphabet.russian.rawValue))
            }
        } else {
            if sizeChoseControl.selectedSegmentIndex == 0 {
                answerLabel.text = String(randomLetter(in: Alphabet.englishCaps.rawValue))
            } else {
                answerLabel.text = String(randomLetter(in: Alphabet.english.rawValue))
            }
        }
    }
    
//MARK: - Private Methods
    private func randomLetter(in letters: String) -> Character {
        return letters.randomElement() ?? "❓"
    }
}

