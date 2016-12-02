//
//  Match.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/17/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class Match: NSObject, NSCoding
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(matchID, forKey: "matchID")
        aCoder.encode(winnerDict, forKey: "winnerDict")
        aCoder.encode(loserDict, forKey: "loserDict")
        aCoder.encode(winnerName, forKey: "winnerName")
        aCoder.encode(loserName, forKey: "loserName")
        aCoder.encode(winningScore, forKey: "winningScore")
        aCoder.encode(losingScore, forKey: "losingScore")
        aCoder.encode(winnerID, forKey: "winnerID")
        aCoder.encode(loserID, forKey: "loserID")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "date") as! String
        self.matchID = aDecoder.decodeInteger(forKey: "matchID")
        self.winnerDict = aDecoder.decodeObject(forKey: "winnerDict") as! [String: AnyObject]
        self.loserDict = aDecoder.decodeObject(forKey: "loserDict") as! [String: AnyObject]
        self.winnerName = aDecoder.decodeObject(forKey: "winnerName") as! String
        self.loserName = aDecoder.decodeObject(forKey: "loserName") as! String
        self.winningScore = aDecoder.decodeInteger(forKey: "winningScore")
        self.losingScore = aDecoder.decodeInteger(forKey: "losingScore")
        self.winnerID = aDecoder.decodeInteger(forKey: "winnerID")
        self.loserID = aDecoder.decodeInteger(forKey: "loserID")
    }



}
