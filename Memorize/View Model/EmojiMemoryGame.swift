//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Pender on 20/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()

    static var themes = [
        Theme(name: "Default", emojiSet: ["👻", "👽", "🐮", "🚴‍♂️", "🐶", "🤖", "🎃", "🐱", "🧘", "🎸", "⌚️", "🖥"], numberOfCardsToShow: 12, color: .red),
        Theme(name: "Animals", emojiSet: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐨", "🐼"], color: .green),
        Theme(name: "Food", emojiSet: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇"], numberOfCardsToShow: 8, color: .blue)
    ]

    static func createMemoryGame() -> MemoryGame<String> {
        let theme = themes[Int.random(in: 0..<themes.count)]
        let numberOfCards = theme.numberOfCardsToShow ?? Int.random(in: 1...theme.emojiSet.count)
        return MemoryGame<String>(theme: theme, numberOfPairsOfCards: numberOfCards) { pairIndex in
            theme.emojiSet[pairIndex]
        }
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    var score: Int {
        model.score
    }
    
    var themeColor: Color {
        model.theme.color
    }
    
    var themeTitle: String {
        model.theme.name
    }


    // MARK: - Intent

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
