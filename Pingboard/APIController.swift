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

    func getPingPlayersAPI()// -> [[String: AnyObject]]
    {
        var playersResult = [String: AnyObject]()
        
        let url = URL(string:"https://tiy-pingpong-api.herokuapp.com/rest/player/list")
        var request = URLRequest(url: url!)
        request.addValue("hGsZ9J4kvxbBNRqGSEM7JtfDlSU/qh8Z", forHTTPHeaderField: "x-authorization-key")
        //request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            do {
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: AnyObject]
                
                if let myJSON = myJSON {
                    playersResult = myJSON
                    self.delegate.getThePlayers(thePlayersArray: playersResult)
                    //print(playersResult)
//                    for i in 0..<parseJSON.count
//                    {
//                        //let capabilitiesDict = parseJSON[i]
//                        capabilities.append(parseJSON)
//                    }
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        //print(playersResult)
        //return playersResult
    }
}