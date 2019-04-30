//
//  ViewController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 08/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var difficultyPassedOver : String?
    var difficultyNumber = 10
    
    //Set timer length
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    
    var numberGenerator = NumberGenerator(difficultySelected: 10)
    
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt1: UIButton!
    
    @IBOutlet weak var questionProblemLabel: UILabel!
    var amountOfQuestionsCounter = 0
    var correctQuestionsCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDifficulty()
        startGame()
    }
    
    func setupDifficulty() {
        if(difficultyPassedOver == "Hard"){
            difficultyNumber = 30
        }
        else if(difficultyPassedOver == "Medium"){
            difficultyNumber = 20
        }
        else if(difficultyPassedOver == "Easy"){
            difficultyNumber = 10
        }
    }
    
    func startGame() {
        amountOfQuestionsCounter = 0
        score.text = "0/\(String(amountOfQuestionsCounter))"
        
        runTimer()
        newQuestion()
        }
    
    func newQuestion() {
       
        numberGenerator = NumberGenerator(difficultySelected: difficultyNumber)
        
        questionProblemLabel.text = numberGenerator.questionProblem
        setNumbers(numberDic: numberGenerator.numbersDictionary!)
    }
    
    func setNumbers(numberDic: Dictionary<String, Int>) {
        
        for (position, number) in numberDic {
            if(Int(position) == 1){
                UIView.performWithoutAnimation {
                    bt1.setTitle(String(number), for: .normal)
                }
            }
            else if(Int(position) == 2){
                UIView.performWithoutAnimation {
                    bt2.setTitle(String(number), for: .normal)
                }
            }
            else if(Int(position) == 3){
                UIView.performWithoutAnimation {
                    bt3.setTitle(String(number), for: .normal)
                }            }
            else if(Int(position) == 4){
                UIView.performWithoutAnimation {
                    bt4.setTitle(String(number), for: .normal)
                }
            }
        }
        
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        
        if(seconds == 0){
        saveHighScoreLocalStorage()
        stopAndResetTimer()
        resetGame();
        }
            
            
        timerLabel.text = "\(seconds)" //This will update the label.
    }
    
    func resetGame() {
        let alert = UIAlertController(title: "Play again?", message: "Do you wan't to play again?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.startGame()
        }))
        
        
        self.present(alert, animated: true)
    }
    
    func stopAndResetTimer() {
       seconds = 60 //This will update the label.
       timer.invalidate()
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        amountOfQuestionsCounter = amountOfQuestionsCounter + 1
        
        if(numberGenerator.isPickedCorrect(picked: Int(sender.titleLabel!.text!)!)){
            print("CORRECT!")
            correctQuestionsCounter = correctQuestionsCounter + 1
            score.text = "\(correctQuestionsCounter) / \(String(amountOfQuestionsCounter))"
        }
        else{
            score.text = "\(correctQuestionsCounter) / \(String(amountOfQuestionsCounter))"
            print("FALSE!")
        }
        
        
        newQuestion()
    }
    
    func saveHighScoreLocalStorage() {
        
        if(correctQuestionsCounter != 0){
        let storedObject: Data = UserDefaults.standard.object(forKey: "SavedHighScoreArray") as! Data
        var highScoreArr = try! PropertyListDecoder().decode([HighScore].self, from: storedObject)

        highScoreArr.append(HighScore(score: correctQuestionsCounter, difficulty: String(difficultyPassedOver!), date: Date()))
        
        UserDefaults.standard.set(try! PropertyListEncoder().encode(highScoreArr), forKey: "SavedHighScoreArray")
        }
    }
    
}

