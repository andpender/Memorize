//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Pender on 20/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>

    private var themes = [
        Theme(name: "Default", emojiSet: ["👻", "👽", "🐮", "🚴‍♂️", "🐶", "🤖", "🎃", "🐱", "🧘", "🎸", "⌚️", "🖥"], color: .red),
        Theme(name: "Animals", emojiSet: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐨", "🐼"], color: .green),
        Theme(name: "Food", emojiSet: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇"], color: .blue)
    ]

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCardsToShow) { pairIndex in
            theme.emojiSet[pairIndex]
        }
    }

    func newGame() {
        chosenTheme = themes[Int.random(in: 0..<themes.count)]
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }

    init() {
        chosenTheme = themes[Int.random(in: 0..<themes.count)]
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    private(set) var chosenTheme: Theme
    

    // MARK: - Intent

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
