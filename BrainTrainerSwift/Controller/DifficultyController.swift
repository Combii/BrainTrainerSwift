//
//  DifficultyController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 26/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class DifficultyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickedOnButton(_ sender: UIButton) {
    
        let difficultySelected = sender.titleLabel!.text!
    
        if(difficultySelected == "Hard"){
            sendDifficultyToGame(difficulty: "Hard")
        }
        else if(difficultySelected == "Medium"){
            sendDifficultyToGame(difficulty: "Medium")
        }
        else if(difficultySelected == "Easy"){
            sendDifficultyToGame(difficulty: "Easy")
        }
        
    }
    
    func sendDifficultyToGame(difficulty:String
        ) {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame"{
            
            let destinationVC = segue.destination as! ViewController
            
            //destinationVC.textPassedOver = textField.text!
            
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
