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
    
//    convenience init(name: String, nickname: String, playerID: Int, arrayOfLosses: [[String : AnyObject]], arrayOfWins: [[String: AnyObject]], numberOfWins: Double, numberOfLosses: Double, totalMatches: Double, winningPercentage: Double) {
//        self.name = name
//        self.nickname = nickname
//        self.playerID = playerID
//        self.arrayOfLosses = arrayOfLosses
//        self.arrayOfWins = arrayOfWins
//        self.numberOfLosses = numberOfLosses
//        self.numberOfWins = numberOfWins
//        self.totalMatches = totalMatches
//        self.winningPercentage = winningPercentage
//    }
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

