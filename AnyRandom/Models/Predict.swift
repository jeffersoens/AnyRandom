//
//  YesNo.swift
//  randomLetter
//
//  Created by Дмитрий Селезнев on 03.12.2022.
//
 
//struct Answers {
//    let emoji: Emoji
////    let describe: String
//}
 
enum Emoji: Character {
    case yes = "👍🏻"
    case no = "👎🏻"
    case dontKnow = "🤔"
    
    var describe: String {
        switch self {
        case .yes:
            return "Определенно да!"
        case .no:
            return "Точно не надо!"
        case .dontKnow:
            return "Так и не скажешь..."
        }
    }
}
