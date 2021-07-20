//
//  ContentView.swift
//  Memorize
//
//  Created by Andy Casaceli on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack() {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal)
            HStack(alignment: .center) {
                Button(action: {
                    viewModel.changeTheme(to: .animals)
                }, label: {
                    VStack {
                        Image(systemName: "hare")
                        Text("Animals")
                            .font(.title)
                    }
                })
                Spacer()
                Button(action: {
                    viewModel.changeTheme(to: .vehicles)
                }, label: {
                    VStack {
                        Image(systemName: "car")
                        Text("Vehicles")
                            .font(.title)
                    }
                })
                Spacer()
                Button(action: {
                    viewModel.changeTheme(to: .flags)
                }, label: {
                    VStack {
                        Image(systemName: "flag")
                        Text("Flags")
                            .font(.title)
                    }
                })
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .foregroundColor(EmojiMemoryGame.currentTheme.getColor())
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 11")
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
        }
    }
}

