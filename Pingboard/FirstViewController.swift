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
//    func getTheMatches(thePlayersArray: [String: AnyObject])
//}


class FirstViewController: UIViewController // APIControllerProtocol
{
    

    var anAPIController: APIController!


    override func viewDidLoad()
    {
        super.viewDidLoad()
        //anAPIController = APIController(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        //anAPIController.getPingPlayersAPI()
    }
    
//    func getTheMatches(thePlayersArray: [String : AnyObject])
//    {
//
//        
//    }


}

