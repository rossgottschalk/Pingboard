//
//  Player.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class Player
{
    let name: String
    let nickname: String
    let arrayOfWins: [[String : AnyObject]]
    let arrayOfLosses: [[String : AnyObject]]
    let playerID: Int
    
    var numberOfWins: Double
    var numberOfLosses: Double
    var totalMatches: Double
    var winningPercentage: Double
    
    //var playerMatches: [[String: AnyObject]] = []
    
    //let date: String
//    let id: Int
//    var winnerDict: [String : AnyObject]
//    let loserDict: [String : AnyObject]
//    let winnerName: String
//    let loserName: String
//    let winningScore: Int
//    let losingScore: Int
    //var lossesDict
    init(playerBuilderDict: [String: AnyObject])
    {
        name = playerBuilderDict["name"] as! String
        nickname = playerBuilderDict["nickname"] as! String
        arrayOfWins = playerBuilderDict["wins"] as! [[String : AnyObject]]
        arrayOfLosses = playerBuilderDict["losses"] as! [[String : AnyObject]]
        playerID = playerBuilderDict["id"] as! Int
        
        numberOfWins = Double(arrayOfWins.count)
        numberOfLosses = Double(arrayOfLosses.count)
        totalMatches = numberOfWins + numberOfLosses
        winningPercentage = numberOfWins/totalMatches
    }
    
}

//struct winsAndLosses
//{
//    let date: String
//    let id: Int
//    let winner: [String : AnyObject]
//    let loser: [String : AnyObject]
//    let winningScore: Int
//    let losingScore: Int
//    
//    init(matchBuilderDict: [String: AnyObject])
//    {
//        date = matchBuilderDict["dates"] as! String
//        id = matchBuilderDict["id"] as! Int
//        winner = matchBuilderDict["winner"] as! [String : AnyObject]
//        loser = matchBuilderDict["loser"] as! [String : AnyObject]
//        winningScore = matchBuilderDict["winningScore"] as! Int
//        losingScore = matchBuilderDict["loosingScore"] as! Int
//    }
//}

