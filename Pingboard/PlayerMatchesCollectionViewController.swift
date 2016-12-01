//
//  PlayerMatchesCollectionViewController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class PlayerMatchesCollectionViewController: UICollectionViewController {
    
    var player: Player?
    var matches: [Match] = []
    var anAPIController: APIController!

    
    override func viewDidLoad(){
        self.title = "Player Bio"
        super.viewDidLoad()
        getPlayerMatches()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
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
        //cell.dateLabel.text = match.date
    
        // Configure the cell
        return cell
    }
    
    func getPlayerMatches()
    {
        var allMatches = [Match]()
        var sortedMatches = [Match]()
        let playerID = player?.playerID
        
        if let loadedData = UserDefaults.standard.data(forKey: "matchData")
        {
            let loadedMatch = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Match]
            allMatches = loadedMatch
        }
        for aMatch in allMatches
        {
            if aMatch.winnerID == playerID!
            {
                sortedMatches.append(aMatch)
            }
            if aMatch.loserID == playerID!
            {
                sortedMatches.append(aMatch)
            }
        }
        self.matches = sortedMatches
        self.collectionView?.reloadData()
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

}
