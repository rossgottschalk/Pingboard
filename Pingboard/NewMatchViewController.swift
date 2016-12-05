//
//  NewMatchViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
protocol PlayerDelegate
{
    func playerWasSelected(player: Player)
}

class NewMatchViewController: UIViewController, UIPopoverPresentationControllerDelegate, PlayerDelegate
{
    
    
    @IBOutlet var drop1: UIButton!
    @IBOutlet var drop2: UIButton!
    @IBOutlet var player1ScoreText: UITextField!
    @IBOutlet var player2ScoreText: UITextField!
    
    let standingsVC = StandingsTableViewController()
    var anAPIController = APIController()
    var players: [Player] = []
    var player1: Player?
    var player2: Player?
    var player1Score: Int = 0
    var player2Score: Int = 0
    var player1Name: String = ""
    var player1ID: Int = 0
    var player2Name: String = ""
    var player2ID:Int = 0
    let date = Date()
    let formatter = DateFormatter()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Match"
        formatter.dateFormat = "MM/dd/yy"
        getThePlayers()
        
        
        //Drop Down Menus/////////////////////////////////////////////////////////////
//        drop1.initMenu([players], actions: [({ () -> (Void) in
//            print("Estou fazendo a ação A")
//        }), ({ () -> (Void) in
//            print("Estou fazendo a ação B")
//        }), ({ () -> (Void) in
//            print("Estou fazendo a ação C")
//        })])
//        
//        drop2.initMenu(["Item A", "Item B", "Item C"], actions: [({ () -> (Void) in
//            print("Estou fazendo a ação A")
//        }), ({ () -> (Void) in
//            print("Estou fazendo a ação B")
//        }), ({ () -> (Void) in
//            print("Estou fazendo a ação C")
//        })])
        ///////////////////////////////////////////////////////////////////////////////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "popoverSegue"
        {
            if let popoverVC = segue.destination as? DropdownTableViewController
            {
                popoverVC.players = players
                popoverVC.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverVC.preferredContentSize = CGSize(width: 150, height: 100)
                popoverVC.popoverPresentationController?.delegate = self
                popoverVC.popoverPresentationController?.permittedArrowDirections = .up
                popoverVC.popoverPresentationController?.sourceView = self.drop1
                popoverVC.popoverPresentationController?.sourceRect = CGRect(x:93.5, y: 100, width: 0, height: 0)
                popoverVC.delegate = self
            }
//            popoverVC.modalPresentationStyle = UIModalPresentationStyle.popover
//            popoverVC.preferredContentSize = CGSize(width: 150, height: 300)
//            popoverVC.popoverPresentationController?.delegate = self
//            popoverVC.delegate = self
        }
        if segue.identifier == "popoverSegue2"
        {
            if let popoverVC = segue.destination as? DropdownTableViewController
            {
                popoverVC.players = players
                popoverVC.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverVC.preferredContentSize = CGSize(width: 150, height: 100)
                popoverVC.popoverPresentationController?.delegate = self
                popoverVC.popoverPresentationController?.permittedArrowDirections = .up
                popoverVC.popoverPresentationController?.sourceView = self.drop2
                popoverVC.popoverPresentationController?.sourceRect = CGRect(x:93.5, y: 100, width: 0, height: 0)
                popoverVC.delegate = self
            }
        }

        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    //MARK: - Action Handlers

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        let p1score = Int(player1ScoreText.text!)
        let p2score = Int(player2ScoreText.text!)
        let theDate = formatter.string(from: date)

        player1Score = p1score!
        player2Score = p2score!
        
        player1Name = (player1?.name)!
        player2Name = (player2?.name)!
        player1ID = (player1?.playerID)!
        player2ID = (player2?.playerID)!
        
        
        
        if (player1Score > player2Score)
        {
            anAPIController.postMatch(loserName: player2Name, loserID: player2ID, losingScore: player2Score, winnerName: player1Name, winnerID: player1ID, winningScore: player1Score, date: theDate)
        }
        else
        {
            anAPIController.postMatch(loserName: player1Name, loserID: player1ID, losingScore: player1Score, winnerName: player2Name, winnerID: player2ID, winningScore: player2Score, date: theDate)
        }
        
        drop1.setTitle("Add Player 1", for: .normal)
        drop2.setTitle("Add Player2", for: .normal)
        player1ScoreText.text = ""
        player2ScoreText.text = ""
        players.append(player1!)
        players.append(player2!)
        player1 = nil
        
        APISingleton.sharedInstance.newMatchSent = true
        //standingsVC.newMatchSent = true
        //print("\(standingsVC.newMatchSent)*******************************************************")
        //standingsVC.newMatchSent = true
    }

    func getThePlayers()
    {
        if let loadedData = UserDefaults.standard.data(forKey: "playerData")
        {
            let loadedPlayer = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Player]
            self.players = loadedPlayer
        }
    }
    
    func playerWasSelected(player: Player)
    {
        if (player1 == nil)
        {
            player1 = player
            drop1.setTitle(player1?.name, for: .normal)
            let index = players.index(of: player1!)
            print(index)
            //players.remove(at: index!)
        }
        else
        {
            player2 = player
            drop2.setTitle(player2?.name, for: .normal)
            let index = players.index(of: player2!)
            //players.remove(at: index!)
        }
    }
}

