//
//  PlayerBuilder.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class PlayerBuilder
{
    let name: String
    let nickname: String
    let winningMatches: [[String : AnyObject]]
    let losingMatches: [[String : AnyObject]]
    let playerID: Int
    
    init(playerBuilderDict: [String: AnyObject])
    {
        name = playerBuilderDict["name"] as! String
        nickname = playerBuilderDict["nickname"] as! String
        winningMatches = playerBuilderDict["wins"] as! [[String : AnyObject]]
        losingMatches = playerBuilderDict["losses"] as! [[String : AnyObject]]
        playerID = playerBuilderDict["id"] as! Int
    }
    struct winsAndLosses {
        
    }

}

struct winsAndLosses
{
    let date: String
    let id: Int
    let winner: [String : AnyObject]
    let loser: [String : AnyObject]
    let winningScore: Int
    let losingScore: Int
    
    init(matchBuilderDict: [String: AnyObject])
    {
        date = matchBuilderDict["dates"] as! String
        id = matchBuilderDict["id"] as! Int
        winner = matchBuilderDict["winner"] as! [String : AnyObject]
        loser = matchBuilderDict["loser"] as! [String : AnyObject]
        winningScore = matchBuilderDict["winningScore"] as! Int
        losingScore = matchBuilderDict["loosingScore"] as! Int
    }
}

