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
    
    var match: RPSMatch!
    var gameHistory = [RPSMatch]()
    
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
    
    func throwDown(_ playersMove: RPS) {
        let computerMove = RPS()
        
        self.match = RPSMatch(player1: playersMove, player2: computerMove)
        
        gameHistory.append(match)
        
        if playersMove == .paper {
            playerChoice = PlayerChoice.choicePaper.rawValue
            self.performSegue(withIdentifier: "paperClicked", sender: self)
        }
            
        else if playersMove == .rock {
            playerChoice = PlayerChoice.choiceRock.rawValue
            
            let gameResultVC = storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
            
            gameResultVC.initData(playerChoice: self.playerChoice, match: self.match)
            
            self.present(gameResultVC, animated: true, completion: nil)
        }
        
        else if playersMove == .scissors {
            playerChoice = PlayerChoice.choiceScissors.rawValue
        }
    }

    @IBAction func makeYourMove(_ sender: UIButton) {
        switch sender {
        case paperButton:
            throwDown(RPS.paper)
        case rockButton:
            throwDown(RPS.rock)
        case scissorsButton:
            throwDown(RPS.scissors)
        default:
            assert(false, "An unknown button is triggered makeYourMove()")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "scissorsClicked" || segue.identifier == "paperClicked") {
            let gameResultVC = segue.destination as! GameResultViewController
            gameResultVC.initData(playerChoice: self.playerChoice, match: match)
        } else if segue.identifier == "SegueToHistoryViewController" {
            let historyVC = segue.destination as! HistoryViewController
        }
    }

}
