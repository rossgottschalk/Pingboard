//
//  MatchCenterCollectionViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/23/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
class MatchCenterCollectionViewController: UICollectionViewController//, APIControllerProtocolMatches
{
    var anAPIController: APIController!
    var matches: [Match] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Match History"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTheMatches()
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
    
    func getTheMatches()
    {
        var theMatches = [Match]()
        if let loadedData = UserDefaults.standard.data(forKey: "matchData")
        {
            let loadedMatch = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Match]
            theMatches = loadedMatch
        }
        matches = theMatches
        matches.sort(by: {$0.date > $1.date})

        collectionView?.reloadData()
    }
}
