//
//  DifficultyController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 26/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class DifficultyController: UIViewController {

    var difficultySelected = "TEST"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickedOnButton(_ sender: UIButton) {
    
        difficultySelected = sender.titleLabel!.text!
    
        if(difficultySelected == "Hard"){
            sendDifficultyToGame()
        }
        else if(difficultySelected == "Medium"){
            sendDifficultyToGame()
        }
        else if(difficultySelected == "Easy"){
            sendDifficultyToGame()
        }
        
    }
        
    
    @IBAction func highscoreButtonClicked(_ sender: UIButton) {
        if(difficultySelected == sender.titleLabel!.text!){
            changeToHighScoreView()
        }
    }
    
    func changeToHighScoreView() {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    func sendDifficultyToGame() {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame"{
            
            let destinationVC = segue.destination as! ViewController
            
            destinationVC.difficultyPassedOver = difficultySelected
            
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
