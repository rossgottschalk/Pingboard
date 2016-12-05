//
//  StandingsTableViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func getThePlayers(playersDict: [String: AnyObject])
    func getTheMatches(matchesDict: [String: AnyObject])
}
class StandingsTableViewController: UITableViewController, APIControllerProtocol
{
    
    var anAPIController: APIController!
    var players: [Player] = []
    var matches: [Match] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Standings"
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {

        if APISingleton.sharedInstance.newMatchSent == true
        {
            //print("\(APISingleton.sharedInstance.newMatchSent)***************************")
            makeAPICalls()
        }
        APISingleton.sharedInstance.newMatchSent = false
        //print("\(APISingleton.sharedInstance.newMatchSent)**********************")

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = "\(player.arrayOfWins.count)-\(player.arrayOfLosses.count)"
        // Configure the cell...
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "playerBioSegue"
        {
            let detailVC = segue.destination as! PlayerMatchesCollectionViewController
            let selectedCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedCell)
            let selectedPlayer = players[(indexPath?.row)!]
            detailVC.player = selectedPlayer
        }
    }
    
    //MARK: - Action Handlers
    func getThePlayers(playersDict: [String : AnyObject])
    {
        var allPlayers = [Player]()
        let anAPIResult = APIResult(resultDict: playersDict)
        
        for aPlayer in anAPIResult.resultArray
        {
            let newPlayer = Player(playerBuilderDict: aPlayer)
            allPlayers.append(newPlayer)
        }
        
        self.players = allPlayers
        
        
    
        players.sort(by: {$0.winningPercentage > $1.winningPercentage})
        
        
        let playerData = NSKeyedArchiver.archivedData(withRootObject: self.players)
        UserDefaults.standard.set(playerData, forKey:"playerData")
        
        self.tableView.reloadData()
    }
    
    func getTheMatches(matchesDict: [String: AnyObject])
    {
        var allMatches = [Match]()
        let anAPIResult = APIResult(resultDict: matchesDict)
        
        for aMatch in anAPIResult.resultArray
        {
            let newMatch = Match(matchBuilderDict: aMatch)
            allMatches.append(newMatch)
        }
        self.matches = allMatches
        
        let matchData = NSKeyedArchiver.archivedData(withRootObject: self.matches)
        UserDefaults.standard.set(matchData, forKey: "matchData")
    }
    
    func makeAPICalls()
    {
        anAPIController = APIController(delegate: self as APIControllerProtocol)

        anAPIController.getPingMatchesAPI()
        anAPIController.getPingPlayersAPI()
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
