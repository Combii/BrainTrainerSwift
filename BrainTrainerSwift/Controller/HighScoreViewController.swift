//
//  HighScoreViewController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 27/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var highScores = [HighScore]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let storedObject: Data = UserDefaults.standard.object(forKey: "SavedHighScoreArray") as! Data
        highScores = try! PropertyListDecoder().decode([HighScore].self, from: storedObject)

    }
    
    
  
    
    
}

extension HighScoreViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! HighScoreTableViewCell
        
        let highScore = highScores[indexPath.row]
        cell.scoreLabel?.text = String(highScore.score)
        cell.difficultyLabel?.text = highScore.difficulty
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM/dd/yy"
        
        let now = dateformatter.string(from: highScore.date)
        
        
        cell.dateLabel?.text = now
        
        return cell
    }
    
}


class HighScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
}
