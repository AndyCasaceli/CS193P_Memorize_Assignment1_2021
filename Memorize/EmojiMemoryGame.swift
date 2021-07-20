//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 7/17/21.
//

import SwiftUI

// ViewModel

class EmojiMemoryGame: ObservableObject {
        
    static var currentTheme = Themes.flags
    static var cardCount = 9
    
    static func emojis(_ theme: Themes) -> [String] {
        return theme.getEmojis()
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: cardCount) { pairIndex in
            EmojiMemoryGame.emojis(currentTheme)[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme(to theme: EmojiMemoryGame.Themes) {
        EmojiMemoryGame.currentTheme = theme
        model = EmojiMemoryGame.createMemoryGame()
        print(model.cards)
    }
    
    enum Themes {
        case animals
        case vehicles
        case flags
        
        func getEmojis() -> [String] {
            switch self {
            case .animals:
                return ["🐶", "🐱", "🐭", "🦊", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️"]
            case .vehicles:
                return ["🚗", "🚕", "🚙", "🚌", "🏎", "🚎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽"]
            case .flags:
                return ["🏴‍☠️", "🏁", "🚩", "🇦🇫","🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲"]
            }
        }
        
        func getColor() -> Color {
            switch self {
            case .animals:
                return .yellow
            case .vehicles:
                return .blue
            case .flags:
                return .red
            }
        }
    }
}
