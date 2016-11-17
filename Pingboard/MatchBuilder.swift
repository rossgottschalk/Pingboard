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
    let player1: String
    let player2: String
    let player1Score: Int
    let player2Score: Int
    
    init(matchBuilderDict: [String: AnyObject])
    {
        date = matchBuilderDict["dates"] as! String
        id = matchBuilderDict["id"] as! Int
        player1 = matchBuilderDict["playerOne"] as! String
        player2 = matchBuilderDict["playerTwo"] as! String
        player1Score = matchBuilderDict["playerOneScore"] as! Int
        player2Score = matchBuilderDict["playerTwoScore"] as! Int
    }

}
