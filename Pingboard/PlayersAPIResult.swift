//
//  PlayersAPIResult.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class PlayersAPIResult
{
    let arrayOfPlayers: [[String: AnyObject]]

    init(resultDict: [String: AnyObject])
    {
        arrayOfPlayers = resultDict["content"] as! [[String: AnyObject]]
    }
}
