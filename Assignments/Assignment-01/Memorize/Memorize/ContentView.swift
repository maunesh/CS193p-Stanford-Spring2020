//
//  ContentView.swift
//  Memorize
//
//  Created by Maunesh Ahir on 5/20/20.
//  Copyright © 2020 Maunesh Ahir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var font: Font {
        viewModel.cards.count == 10 ? Font.body : Font.largeTitle
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {self.viewModel.choose(card: card)})
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(font)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(0.66, contentMode: .fit)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews:  some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
