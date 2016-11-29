//
//  Match.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/17/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class Match
{
    let date: String
    let matchID: Int
    var winnerDict: [String : AnyObject]
    let loserDict: [String : AnyObject]
    let winnerName: String
    let loserName: String
    let winningScore: Int
    let losingScore: Int
    let winnerID: Int
    let loserID: Int
    
    init(matchBuilderDict: [String: AnyObject])
    {
        date = matchBuilderDict["dates"] as! String
        matchID = matchBuilderDict["id"] as! Int
        winnerDict = matchBuilderDict["winner"] as! [String : AnyObject]
        loserDict = matchBuilderDict["loser"] as! [String : AnyObject]
        winnerName = matchBuilderDict["winner"]?["name"] as! String
        loserName = matchBuilderDict["loser"]?["name"] as! String
        winningScore = matchBuilderDict["winningScore"] as! Int
        losingScore = matchBuilderDict["losingScore"] as! Int
        winnerID = matchBuilderDict["winner"]?["id"] as! Int
        loserID = matchBuilderDict["loser"]?["id"] as! Int
    }

}
