//
//  MatchBuilder.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/17/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class MatchBuilder
{
    let date: String
    let id: Int
    var winnerDict: [String : AnyObject]
    let loserDict: [String : AnyObject]
    let winnerName: String
    let loserName: String
    let winningScore: Int
    let losingScore: Int
    
    init(matchBuilderDict: [String: AnyObject])
    {
        date = matchBuilderDict["dates"] as! String
        id = matchBuilderDict["id"] as! Int
        winnerDict = matchBuilderDict["winner"] as! [String : AnyObject]
        loserDict = matchBuilderDict["loser"] as! [String : AnyObject]
        winnerName = matchBuilderDict["winner"]?["name"] as! String
        loserName = matchBuilderDict["loser"]?["name"] as! String
        winningScore = matchBuilderDict["winningScore"] as! Int
        losingScore = matchBuilderDict["loosingScore"] as! Int
    }

}
