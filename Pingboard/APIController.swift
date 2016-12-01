//
//  APIController.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class APIController
{
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    var delegate: APIControllerProtocol!
    
    func getPingPlayersAPI()
    {
        var playersResult = [String: AnyObject]()
        
        let url = URL(string:"https://tiy-pingpong.herokuapp.com/rest/player/list")
        var request = URLRequest(url: url!)
        request.addValue("hGsZ9J4kvxbBNRqGSEM7JtfDlSU/qh8Z", forHTTPHeaderField: "x-authorization-key")
        //request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            do
            {
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: AnyObject]
                
                if let myJSON = myJSON
                {
                    playersResult = myJSON
                    self.delegate.getThePlayers(playersDict: playersResult)
                }
            }
            catch
            {
                print(error)
            }
            
        }
        task.resume()
    }
    
    func getPingMatchesAPI()
    {
        var matchesResult = [String: AnyObject]()
        let url = URL(string:"https://tiy-pingpong.herokuapp.com/rest/match/list")
        var request = URLRequest(url: url!)
        request.addValue("hGsZ9J4kvxbBNRqGSEM7JtfDlSU/qh8Z", forHTTPHeaderField: "x-authorization-key")
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            do
            {
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: AnyObject]
                
                if let myJSON = myJSON
                {
                    matchesResult = myJSON
                    self.delegate.getTheMatches(matchesDict: matchesResult)
                    //self.playerMatchesDelegate.getPlayerMatches(playerMatchesDict: matchesResult)
                }
            }
            catch
            {
                print(error)
            }
        }
        task.resume()
    }
    
    func postMatch()
    {
        let aMatch = ["dates": "11/20/16", "loser": ["name": "Raul Lavin"], "losingScore": 8, "winner": ["name": "Nick James"], "winningScore": 21] as [String : Any]
        var jsonString: NSData?
        let url = URL(string:"https://tiy-pingpong.herokuapp.com/rest/match/save")
        let request = NSMutableURLRequest(url: url!)
        request.addValue("hGsZ9J4kvxbBNRqGSEM7JtfDlSU/qh8Z", forHTTPHeaderField: "x-authorization-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            jsonString = try JSONSerialization.data(withJSONObject: aMatch, options: []) as NSData?
        } catch let error as NSError {
            print(error)
        }
        
        let postString = jsonString
        request.httpBody = postString as Data?
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
        }
        task.resume()
        return
    }
    func postPlayer()
    {
        let aPlayer = ["name": "Ross Gottschalk", "nickname": "The Savage", "wins": 0, "losses": 0, "id": 0] as [String : Any]
        var jsonString: NSData?
        let url = URL(string:"https://tiy-pingpong.herokuapp.com/rest/player/save")
        let request = NSMutableURLRequest(url: url!)
        request.addValue("hGsZ9J4kvxbBNRqGSEM7JtfDlSU/qh8Z", forHTTPHeaderField: "x-authorization-key")
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpMethod = "POST"
        do {
            jsonString = try JSONSerialization.data(withJSONObject: aPlayer, options: []) as NSData?
        } catch let error as NSError {
            print(error)
        }
        
        let postString = jsonString
        request.httpBody = postString as Data?
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
        }
        task.resume()
        return
    }
}
