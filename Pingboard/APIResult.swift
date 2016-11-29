//
//  APIResult.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 11/17/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
class APIResult
{
    let resultArray: [[String: AnyObject]]
    
    init(resultDict: [String: AnyObject])
    {
        resultArray = resultDict["content"] as! [[String: AnyObject]]
    }
    
}
