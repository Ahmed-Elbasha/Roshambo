//
//  NewGameViewController.swift
//  Roshambo
//
//  Created by Ahmed Elbasha on 6/26/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    
    var gameHistory: [String]!
    
    enum PlayerChoice : Int {
        case choicePaper = 1,
         choiceRock = 2,
         choiceScissors = 3
    }
    
    var playerChoice : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockButtonPressed(_ sender: Any) {
        playerChoice = PlayerChoice.choiceRock.rawValue
        
        let gameResultVC = storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        
        gameResultVC.initData(playerChoice: self.playerChoice)
        
        self.present(gameResultVC, animated: true, completion: nil)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        playerChoice = PlayerChoice.choicePaper.rawValue
        self.performSegue(withIdentifier: "paperClicked", sender: self)
    }
    
    @IBAction func scissorsbuttonWasPresssed(_ sender: Any) {
        playerChoice = PlayerChoice.choiceScissors.rawValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "scissorsClicked" || segue.identifier == "paperClicked") {
            let gameResultVC = segue.destination as! GameResultViewController
            gameResultVC.initData(playerChoice: self.playerChoice)
        } else if segue.identifier == "SegueToHistoryViewController" {
            let historyVC = segue.destination as! HistoryViewController
        }
    }

}
