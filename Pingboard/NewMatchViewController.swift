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
    var anAPIController: APIController!
    var players: [Player] = []
    
    
    @IBOutlet var drop1: UIButton!
    @IBOutlet var drop2: UIButton!
    
    var player1: Player?
    var player2: Player?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Match"
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
                popoverVC.popoverPresentationController?.sourceRect = CGRect(x:108.5, y: 100, width: 0, height: 0)
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
                popoverVC.popoverPresentationController?.sourceRect = CGRect(x:108.5, y: 100, width: 0, height: 0)
                popoverVC.delegate = self
            }
        }

        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }


    @IBAction func buttonPressed(_ sender: UIButton)
    {
        anAPIController.postMatch()
    }
    
//    @IBAction func player1buttonPressed(_ sender: UIButton)
//    {
//        
//    }

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
            players.remove(at: index!)
            
        }
        else
        {
            player2 = player
            drop2.setTitle(player2?.name, for: .normal)
        }
    }
}

