//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Ahmed Elbasha on 8/9/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation

struct RPSMatch {
    
    // MARK: Properties
    let player1: RPS
    let player2: RPS
    
    // MARK: Initializers
    init(player1: RPS, player2: RPS) {
        self.player1 = player1
        self.player2 = player2
    }
    
    // MARK: Computed Properties
    var winner: RPS {
        get {
            return player1.defeats(player2) ? player1 : player2
        }
    }
    
    var loser: RPS {
        get {
            return player1.defeats(player2) ? player1 : player2
        }
    }
}
