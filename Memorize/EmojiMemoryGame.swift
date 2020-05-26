//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Pender on 20/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static private var themes = [
        Theme(name: "Default", emojiSet: ["👻", "👽", "🐮", "🚴‍♂️", "🐶", "🤖", "🎃", "🐱", "🧘", "🎸", "⌚️", "🖥"], color: .red),
        Theme(name: "Animals", emojiSet: ["🐶","🐱","🐭","🐹","🐰","🦊","🐨","🐼"], color: .brown),
        Theme(name: "Food", emojiSet: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇"], color: .blue)
    ]

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = themes[Int.random(in: 0..<themes.count)].emojiSet
        return MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            return emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
