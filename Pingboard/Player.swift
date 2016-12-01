//
//  Player.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class Player: NSObject, NSCoding
{
    var name: String
    var nickname: String
    var arrayOfWins: [[String : AnyObject]]
    var arrayOfLosses: [[String : AnyObject]]
    var playerID: Int
    
    var numberOfWins: Double
    var numberOfLosses: Double
    var totalMatches: Double
    var winningPercentage: Double
    
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

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(nickname, forKey: "nickname")
        aCoder.encode(playerID, forKey: "id")
        aCoder.encode(arrayOfLosses, forKey: "losses")
        aCoder.encode(arrayOfWins, forKey: "wins")
        aCoder.encode(numberOfWins, forKey: "numberOfWins")
        aCoder.encode(totalMatches, forKey: "totalMatches")
        aCoder.encode(winningPercentage, forKey: "winPercent")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.nickname = aDecoder.decodeObject(forKey: "nickname") as! String
        self.playerID = aDecoder.decodeInteger(forKey: "id") 
        self.arrayOfLosses = aDecoder.decodeObject(forKey: "losses") as! [[String: AnyObject]]
        self.arrayOfWins = aDecoder.decodeObject(forKey: "wins") as! [[String: AnyObject]]
        self.numberOfWins = aDecoder.decodeDouble(forKey: "numberOfWins")
        self.numberOfLosses = aDecoder.decodeDouble(forKey: "numberOfLosses")
        self.totalMatches = aDecoder.decodeDouble(forKey: "totalMatches")
        self.winningPercentage = aDecoder.decodeDouble(forKey: "winPercent")
    }
    
}
