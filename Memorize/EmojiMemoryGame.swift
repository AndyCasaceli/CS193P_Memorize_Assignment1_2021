//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 7/17/21.
//

import SwiftUI

// ViewModel

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🐶", "🐱", "🐭", "🦊", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
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
}
