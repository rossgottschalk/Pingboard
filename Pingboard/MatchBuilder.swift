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
