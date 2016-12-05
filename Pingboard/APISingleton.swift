//
//  APISingleton.swift
//  Pingboard
//
//  Created by Ross Gottschalk on 12/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class APISingleton
{
    var newMatchSent = true
    static let sharedInstance = APISingleton()
}
