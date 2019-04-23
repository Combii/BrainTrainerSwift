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
    
    
    @IBOutlet weak var score: UITextField!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    var numberGenerator = NumberGenerator()
    
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt1: UIButton!
    
    @IBOutlet weak var questionProblemLabel: UILabel!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        runTimer()
        newQuestion()
    }
    
    func newQuestion() {
       
        numberGenerator = NumberGenerator()
        
        questionProblemLabel.text = numberGenerator.questionProblem
        setNumbers(numberDic: numberGenerator.returnDict!)
    }
    
    func setNumbers(numberDic: Dictionary<String, Int>) {
        
        let btns = [bt1, bt2, bt3, bt4]
        
        UIView.performWithoutAnimation {
            for (position, number) in numberDic {
                btns[(Int(position) ?? 0) - 1]?.setTitle(String(number), for: .normal)
            }
        }
        
        /*
        for (position, number) in numberDic {
            if(Int(position) == 1){
                UIView.performWithoutAnimation {
                    bt1.setTitle(String(number), for: .normal)
                }
            }
            else if(Int(position) == 2){
                UIView.performWithoutAnimation {
                    bt2.titleLabel?.text = String(number)
                }
                
            }
            else if(Int(position) == 3){
                UIView.performWithoutAnimation {
                    bt3.titleLabel?.text = String(number)
                }            }
            else if(Int(position) == 4){
                UIView.performWithoutAnimation {
                    bt4.titleLabel?.text = String(number)
                }
            }
        }
        */
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)" //This will update the label.
    }
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
      
        newQuestion()
    }
    
}

