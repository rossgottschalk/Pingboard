//
//  MatchCenterCollectionViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/23/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocolMatches
{
    func getTheMatches(matchesDict: [String: AnyObject])
}


class MatchCenterCollectionViewController: UICollectionViewController, APIControllerProtocolMatches
{
    var anAPIController: APIController!
    var matches: [Match] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        anAPIController = APIController(delegate: self as APIControllerProtocolMatches)
        anAPIController.getPingMatchesAPI()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return matches.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ScoreboardCell
        let match = matches[indexPath.row]
        cell.winnerLabel.text = "\(match.winnerName) ✓"
        cell.loserLabel.text = match.loserName
        cell.winnerScore.text = "\(match.winningScore)"
        cell.loserScore.text = "\(match.losingScore)"
        cell.dateLabel.text = match.date
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func getTheMatches(matchesDict: [String: AnyObject])
    {
        var allMatches = [Match]()
        let anAPIResult = APIResult(resultDict: matchesDict)
        //let aWinsAndLossesResult = PlayerBuilder(playerBuilderDict: thePlayersArray)
        
        for aMatch in anAPIResult.resultArray
        {
            let newMatch = Match(matchBuilderDict: aMatch)
            allMatches.append(newMatch)
        }
        //        for aPlayer in aWinsAndLossesResult.winningMatches
        //        {
        //            let newPlayer = PlayerBuilder
        //        }
        //print(thePlayersArray)
        self.matches = allMatches
        self.collectionView?.reloadData()

        //print(theMatchesArray)
    }


}
