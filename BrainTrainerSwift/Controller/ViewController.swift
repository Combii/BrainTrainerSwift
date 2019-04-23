//
//  ViewController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 08/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var timerLabel: UITextField!
    
    
    @IBOutlet weak var score: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    var numberGenerator = NumberGenerator()
    
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt1: UIButton!
    
    @IBOutlet weak var questionProblemLabel: UILabel!
    var amountOfQuestionsCounter = 0
    var correctQuestionsCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        score.text = "0/\(String(amountOfQuestionsCounter))"

        //runTimer()
        newQuestion()
    }
    
    func newQuestion() {
       
        numberGenerator = NumberGenerator()
        
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
        timerLabel.text = "\(seconds)" //This will update the label.
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
    
}

