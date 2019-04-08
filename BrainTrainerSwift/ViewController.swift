//
//  ViewController.swift
//  BrainTrainerSwift
//
//  Created by David Støvlbæk on 08/04/2019.
//  Copyright © 2019 David Støvlbæk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        
            print(sender.titleLabel!.text)
        
    }
    
}

