//
//  FirstViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
//protocol APIControllerProtocol
//{
//    func getThePlayers(thePlayersArray: [String: AnyObject])
//}


class FirstViewController: UIViewController //APIControllerProtocol
{

    //var anAPIController: APIController!


    override func viewDidLoad() {
        super.viewDidLoad()
        //anAPIController = APIController(delegate: self)

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        //anAPIController.getPingPlayersAPI()
    }
    
//    func getThePlayers(thePlayersArray: [String : AnyObject])
//    {
//        var playersArray = [PlayerBuilder]()
//        let anAPIResult = APIResult(resultDict: thePlayersArray)
//        
//        for aPlayer in anAPIResult.playersArray
//        {
//            let newPlayer = PlayerBuilder(playerBuilderDict: aPlayer)
//            playersArray.append(newPlayer)
//        }
////        let newGameClues = newCluesArray
////        let newGame = Game()
////        newGame.clueArray = newGameClues
////        
////        arrayOfGames.append(newGame)
//        
//        
//        print(thePlayersArray)
//        
//    }


}

