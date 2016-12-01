//
//  NewMatchViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class NewMatchViewController: UIViewController
{
    var anAPIController: APIController!
    var players: [Player] = []
    
    
    @IBOutlet var drop1: DropMenuButton!
    @IBOutlet var drop2: DropMenuButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getThePlayers()
        
        //Drop Down Menus/////////////////////////////////////////////////////////////
        drop1.initMenu(["Item A", "Item B", "Item C"], actions: [({ () -> (Void) in
            print("Estou fazendo a ação A")
        }), ({ () -> (Void) in
            print("Estou fazendo a ação B")
        }), ({ () -> (Void) in
            print("Estou fazendo a ação C")
        })])
        
        drop2.initMenu(["Item A", "Item B", "Item C"], actions: [({ () -> (Void) in
            print("Estou fazendo a ação A")
        }), ({ () -> (Void) in
            print("Estou fazendo a ação B")
        }), ({ () -> (Void) in
            print("Estou fazendo a ação C")
        })])
        ///////////////////////////////////////////////////////////////////////////////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        anAPIController.postMatch()
    }
    
    func getThePlayers()
    {
        if let loadedData = UserDefaults.standard.data(forKey: "playerData")
        {
            let loadedPlayer = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Player]
            self.players = loadedPlayer
        }
    }
}

