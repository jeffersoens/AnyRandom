//
//  RandomModes.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 29.11.2022.
//

//Test Commit
  
struct RandomMode {
    let segueIdentifier: String
    let title: String
    let description: String
    let image: String
    
    static func getRandomModes() -> [RandomMode] {
        [
            RandomMode(
                segueIdentifier: "goToRandomLetter",
                title: "Случайная буква",
                description: "Случайная буква на русском или английском языке",
                image: "letter"
            ),
            RandomMode(
                segueIdentifier: "goToTeams",
                title: "Составить команды",
                description: "Поделите группу людей на команды",
                image: "team"
            ),
            RandomMode(
                segueIdentifier: "goToRandomWord",
                title: "Случайное слово",
                description: "Случайное слово из списка",
                image: "word"
            ),
            RandomMode(
                segueIdentifier: "goToRandomTime",
                title: "Случайное время",
                description: "Случайное время из промежутка",
                image: "time"
            ),
            RandomMode(
                segueIdentifier: "goToLottery",
                title: "Лотерея",
                description: "Случайные результаты из промежутка",
                image: "lottery"
            )
        ]
    }
}
