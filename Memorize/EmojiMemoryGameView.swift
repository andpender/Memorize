//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrew Pender on 20/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }.padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRaidus).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRaidus).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRaidus).fill()
                }
            }
        }
            .font(Font.system(size: fontSize(for: size)))
    }

    // MARK: - Drawing Constants
    let cornerRaidus: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
