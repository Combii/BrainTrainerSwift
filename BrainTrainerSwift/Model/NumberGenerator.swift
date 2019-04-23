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
    var questionProblem: String
    var correctAnswer: Int

    init() {
        returnDict = ["1": 0, "2": 0, "3": 0, "4": 0]
        questionProblem = ""
        correctAnswer = 0
        
        generateNumber()
        questionProblem = generateQuestion()
        
        print(returnDict!)
        print(questionProblem)
    }
    
    mutating func generateNumber() {
    
        returnDict?.forEach({ (arg) -> Void in
            
            let (key, _) = arg
            returnDict?[key] = Int.random(in: 1 ... 10)
        })
    }
    
    mutating func generateQuestion() -> String{
        
        
        if let randomNumber = returnDict![String(Int.random(in: 1 ... 4))]{

            print(randomNumber)
            
            let toSubtract = randomNumber - Int.random(in:1...randomNumber)
            let subtractred = randomNumber - toSubtract;
            
            correctAnswer = randomNumber
            
            return "\(subtractred) + \(toSubtract)"
        }
        return ""
    }
    
    func isCorrect(picked: Int) -> Bool {
    
        if(picked == correctAnswer){
            return true
        }
        return false
    }
    
}
