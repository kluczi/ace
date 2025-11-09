//
//  Stats.swift
//  ace
//
//  Created by Bartek on 08/11/2025.
//

import Foundation

struct Stats: Identifiable, Codable, Equatable {
    let id: String
    var totalMatches:Int
    //diff type of courts win
    var hardPercentWin: Int?
    var clayPercentWin: Int?
    var grassPercentWin: Int?
    var overAllWin:Int?
    var matchesWon: Int?
    var matchesLost: Int?
    
    enum CodingKeys: String, CodingKey {
            case id = "$id"
            case totalMatches, hardPercentWin, grassPercentWin, clayPercentWin, overAllWin, matchesWon, matchesLost
    }
}
