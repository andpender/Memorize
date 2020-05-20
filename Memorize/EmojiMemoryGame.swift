//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Pender on 20/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","👽","🐮","🚴‍♂️","🐶","🤖","🎃","🐱","🧘","🎸","⌚️","🖥"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
