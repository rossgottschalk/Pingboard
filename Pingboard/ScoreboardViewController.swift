//
//  ScoreboardViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
protocol APIControllerProtocolMatches
{
     func getTheMatches(theMatchesArray: [String: AnyObject])
}


class ScoreboardViewController: UIViewController, APIControllerProtocolMatches
{
    var anAPIController: APIController!


    override func viewDidLoad() {
        super.viewDidLoad()
        anAPIController = APIController(delegate: self as APIControllerProtocolMatches)
        anAPIController.getPingMatchesAPI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTheMatches(theMatchesArray: [String: AnyObject])
    {
        print(theMatchesArray)
    }


}

