//
//  ViewController.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 01.12.2022.
//

import UIKit

class LetterViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var languageControl: UISegmentedControl!
    @IBOutlet var sizeControl: UISegmentedControl!
    
    @IBOutlet var copyButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        copyButton.isHidden = true
    }
    
    // MARK: - IB Actions
    
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
    
    @IBAction func generateButtonTapped() {
        
        copyButton.isHidden = false
        
        if languageControl.selectedSegmentIndex == 0 {
            if sizeControl.selectedSegmentIndex == 0 {
                resultLabel.text = String(randomLetter(in: Alphabet.russianCaps.rawValue))
            } else {
                resultLabel.text = String(randomLetter(in: Alphabet.russian.rawValue))
            }
        } else {
            if sizeControl.selectedSegmentIndex == 0 {
                resultLabel.text = String(randomLetter(in: Alphabet.englishCaps.rawValue))
            } else {
                resultLabel.text = String(randomLetter(in: Alphabet.english.rawValue))
            }
        }
    }
    
    //MARK: - Private Methods
    
    private func randomLetter(in letters: String) -> Character {
        return letters.randomElement() ?? "❓"
    }
}
