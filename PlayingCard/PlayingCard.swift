//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by iMAC2 on 15/11/2018.
//  Copyright © 2018 FAST. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank)\(suit)" }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(order)"}
        
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
        
        var order: String {
            switch self {
            case .spades: return "♠"
            case .hearts: return "♠"
            case .diamonds: return "♦"
            case .clubs: return "♣"
            }
        }
        
        static var all = [Suit.spades,.hearts,.diamonds,.clubs]
    }
    
    enum Rank: CustomStringConvertible {
        
        var description: String { return "\(order)"}
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric (let pips): return pips
            case .face (let kind) where kind == "J": return 11
            case .face (let kind) where kind == "Q": return 12
            case .face (let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            return allRanks
        }
    }
    
}
