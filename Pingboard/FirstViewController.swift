//
//  FirstViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

//protocol ListOfPlayersProtocol
//{
//    func getThePlayers(playersArray: [Player])
//}


class FirstViewController: UIViewController//, ListOfPlayersProtocol
{
    var anAPIController: APIController!
    var players: [Player] = []
    var standingsVC: StandingsTableViewController!
    
    



    override func viewDidLoad()
    {
        super.viewDidLoad()
        getArrayOfPlayers()
                //anAPIController = APIController(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        anAPIController.postMatch()
    }
    
    func getArrayOfPlayers()
    {
        if let loadedData = UserDefaults.standard.data(forKey: "playerData")
        {
            let loadedPlayer = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Player]
            print(loadedPlayer.count)
        }
        
    }
    
//    func getThePlayers(playersArray: [Player])
//    {
//        self.players = playersArray
//        print("************************************\(players.count)")
////        var allPlayers = [Player]()
////        let anAPIResult = APIResult(resultDict: playersDict)
////        
////        
////        for aPlayer in anAPIResult.resultArray
////        {
////            let newPlayer = Player(playerBuilderDict: aPlayer)
////            allPlayers.append(newPlayer)
////        }
////        
////        self.players = allPlayers
////        players.sort(by: {$0.winningPercentage > $1.winningPercentage})
//        
//        //self.tableView.reloadData()
//    }

}

