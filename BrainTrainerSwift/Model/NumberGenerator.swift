//
//  NumberGenerator.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 08/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import Foundation
import Darwin

struct NumberGenerator{
    
    var returnDict: [String: Int]?
    
    init() {
        returnDict = ["1": 0, "2": 0, "3": 0, "4": 0]
        generateNumber()
    }
    
    mutating func generateNumber() {
    
        returnDict?.forEach({ (arg) -> Void in
            
            let (key, _) = arg
            returnDict?[key] = Int.random(in: 0 ... 10)
        })
    }
    
}
