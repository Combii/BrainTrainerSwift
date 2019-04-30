//
//  HighScoreViewController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 27/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class HighScoreViewController: UITableViewController {
   
    @IBOutlet var highScoreTableView: UITableView!
    
    var highScores = [HighScore]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highScore1 = HighScore(score: 20
            , difficulty: "Easy"
            , date: NSDate())
        
        
        highScores = [highScore1]


    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let highScore = highScores[indexPath.row]
        cell.scoreLabel?.text = highScore.score
        cell.difficultyLabel?.text = highScore.difficulty
        cell.dateLabel?.text = highScore.date
        
        return cell
    }
    
    
}

class HighScoreTableViewCell: UITableViewCell {
    
  
    
}
