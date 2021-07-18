//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andy Casaceli on 6/25/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // can be a "let" b/c game is a pointer to the EmojiMemoryGame reference.  The pointer will not change, even though the game will when cards are flipped, etc...
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
