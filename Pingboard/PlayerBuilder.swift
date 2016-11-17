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
    let wins: Int
    let losses: Int
    let playerID: Int
    
    init(playerBuilderDict: [String: AnyObject])
    {
        name = playerBuilderDict["name"] as! String
        nickname = playerBuilderDict["nickname"] as! String
        wins = playerBuilderDict["wins"] as! Int
        losses = playerBuilderDict["losses"] as! Int
        playerID = playerBuilderDict["id"] as! Int
    }

}
