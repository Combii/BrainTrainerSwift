//
//  HighScore.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 30/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import Foundation

struct HighScore{
    
    var score : Int
    var difficulty : String
    var date : Date

    init(score : Int, difficulty : String, date : Date) {
        self.score = score
        self.difficulty = difficulty
        self.date = date
    }
    
}
