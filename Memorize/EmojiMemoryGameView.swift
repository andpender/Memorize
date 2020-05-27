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
        VStack {
            Text(viewModel.chosenTheme.name)
                .padding()
                .font(.largeTitle)
            Text("Score: \(viewModel.score)")
                .font(.caption)

            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.padding(5)
            }
                .padding()
                .foregroundColor(viewModel.chosenTheme.color)
            Button(action: {
                self.viewModel.newGame()
            }) {
                Text("New Game")
            }
                .font(.body)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [viewModel.chosenTheme.color, .white]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(40.0)
                .foregroundColor(.black)
        }
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
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
            .font(Font.system(size: fontSize(for: size)))
    }

    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let buttonCornerRadius: CGFloat = 40.0
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
