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
    
    var numbersDictionary: [String: Int]?
    var questionProblem: String
    var correctAnswer: Int
    
    var maxNumber: Int
    
    init() {
        numbersDictionary = ["1": 0, "2": 0, "3": 0, "4": 0]
        questionProblem = ""
        correctAnswer = 0
        maxNumber = 10
        
        generateNumbers()
        questionProblem = generateNewQuestion()
        
        print(numbersDictionary!)
        print(questionProblem)
    }
    
    mutating func generateNumbers() {
    
        numbersDictionary?.forEach({ (arg) -> Void in
            
            let (key, _) = arg
            
            numbersDictionary?[key] = Int.random(in: 1 ... 10)
        })
    }
    
    mutating func generateNewQuestion() -> String   {
        
        return generateSubtractionQuestion()

        //return generateAdditionQuestion()
    }
    
    mutating func generateAdditionQuestion() -> String   {
        
        if let numberResult = numbersDictionary![String(Int.random(in: 1 ... 4))]{
            
            print("RESULT NUMBER: \(numberResult)")
            
            let toSubtract = numberResult - Int.random(in:1...numberResult)
            let subtractred = numberResult - toSubtract;
            
            correctAnswer = numberResult
            
            return "\(subtractred) + \(toSubtract)"
        }
        return ""
    }
    
    mutating func generateSubtractionQuestion() -> String   {
        
        if let numberResult = numbersDictionary![String(Int.random(in: 1 ... 4))]{
            
            print("RESULT NUMBER: \(numberResult)")
            
            let toAdd = numberResult + Int.random(in:numberResult...maxNumber)
            let added = numberResult + toAdd;
            
            correctAnswer = numberResult
            
            return "\(added) - \(toAdd)"
        }
        return ""
    }
    
    func isPickedCorrect(picked: Int) -> Bool {
        
        if(picked == correctAnswer){
            return true
        }
        return false
    }
    
}
