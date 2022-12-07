//
//  CreateTeamsViewController.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 06.12.2022.
//

import UIKit

class TeamsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var teamMembersTF: UITextField!
    @IBOutlet weak var numberOfTeamsTF: UITextField!
    
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
    
    @IBAction func generateButtonTapped() {
        
        if teamMembersTF.text!.isEmpty && numberOfTeamsTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, заполните имена участников и их количество в команде",
                actionTitle: "ОК"
            )
            return
        }
        
        if teamMembersTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, заполните имена участников",
                actionTitle: "ОК"
            )
            return
        }
        
        if numberOfTeamsTF.text!.isEmpty {
            showAlert(
                title: "Введите данные",
                message: "Пожалуйста, укажите количество участников в команде",
                actionTitle: "ОК"
            )
            return
        }
        
        if Int(numberOfTeamsTF.text ?? "0") ?? 0 <= 0 {
            showAlert(
                title: "Неверное количество",
                message: "Количество участников должно быть больше или равняться одному",
                actionTitle: "ОК"
            )
            numberOfTeamsTF.text = ""
            return
        }
        
        var teamMembers: [String] = teamMembersTF.text?.components(separatedBy: ",") ?? []
        
        let numerOfTeams = Int(numberOfTeamsTF.text ?? "0") ?? 2
        
        if numerOfTeams >= teamMembers.count {
            showAlert(
                title: "Неверное количество",
                message: "Количество участиков в одной команде не может превышать общего количества участников",
                actionTitle: "ОК"
            )
            numberOfTeamsTF.text = ""
            return
        }
        
        teamMembers.shuffle()
        
        let results = teamMembers.chunked(into: (numerOfTeams))
        
        resultLabel.text = ""
        
        for (number, result) in results.enumerated() {
            resultLabel.text! += "Команда \(number + 1): \(result.formatted())\n"
        }
        
        resultTitleLabel.isHidden = false
        resultLabel.isHidden = false
        copyButton.isHidden = false
        
        view.endEditing(true)
    }
    
    @IBAction func copyButtonTapped() {
        copyText(for: resultLabel)
    }
    
}

// MARK: - Splitting an Array Into Smaller Arrays by Size

// https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Text Field Delegate

extension TeamsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case teamMembersTF:
            numberOfTeamsTF.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
