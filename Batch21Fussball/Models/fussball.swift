//
//  fussball.swift
//  Batch21Fussball
//
//  Created by Till Hemmerich on 08.11.24.
//

import Foundation
import SwiftData

@Model
class Spieler{
    var name : String
    var nummer : Int
    var manschaft : Manschaft
    
    init(name: String, nummer: Int, manschaft: Manschaft) {
        self.name = name
        self.nummer = nummer
        self.manschaft = manschaft
    }
   
}

@Model
class Manschaft{
    var name : String
    var Stadion : String
    
    @Relationship(deleteRule:.cascade , inverse: \Spieler.manschaft)
    var spieler : [Spieler]
    
    
    init(name: String,Stadion: String, spieler: [Spieler]) {
        self.name = name
        self.Stadion = Stadion
        self.spieler = spieler
    }
}

