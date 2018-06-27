//
//  GameResultViewController.swift
//  Roshambo
//
//  Created by Ahmed Elbasha on 6/27/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerChoice : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImage(playerChoice: self.playerChoice, randomValue: generateRandomValue())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func generateRandomValue() -> Int {
        let randomValue = 1 + arc4random() % 3
        return Int(randomValue)
    }
    
    func setImage(playerChoice: Int, randomValue: Int) {
        if playerChoice == randomValue {
            if (playerChoice == 1) {
                resultImageView.image = UIImage(named: "PaperCoversRock")
                resultLabel.text = "Wohoo! You win!. yes it's paper"
            } else if (playerChoice == 2){
                resultImageView.image = UIImage(named: "RockCrushesScissors")
                resultLabel.text = "Wohoo! You win!. yes it's rock"
            } else if(playerChoice == 3) {
                resultImageView.image = UIImage(named: "ScissorsCutPaper")
                resultLabel.text = "Wohoo! You win!. yes it's scissors"
            }
            
        } else if playerChoice != randomValue {
            if (randomValue == 1) {
                resultImageView.image = UIImage(named: "PaperCoversRock")
                resultLabel.text = "Oops! You lose. no it's paper"
            } else if (randomValue == 2) {
                resultImageView.image = UIImage(named: "RockCrushesScissors")
                resultLabel.text = "Oops! You lose. no it's it's rock"
            } else if (randomValue == 3) {
                resultImageView.image = UIImage(named: "ScissorsCutPaper")
                resultLabel.text = "Oops! You lose. no it's scissors"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData(playerChoice: Int) -> Void {
        self.playerChoice = playerChoice
    }
    
    @IBAction func playAgainButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
