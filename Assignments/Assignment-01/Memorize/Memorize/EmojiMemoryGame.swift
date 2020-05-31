//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maunesh Ahir on 5/21/20.
//  Copyright © 2020 Maunesh Ahir. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻", "🎃", "🕷","🎂","🎁","🎉","🎄","🎅","🤶","🥂","🧣","🍭"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count-1)))
            let emoji = emojis.remove(at: randomIndex)
            return emoji
        }
    }
        
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    
}
