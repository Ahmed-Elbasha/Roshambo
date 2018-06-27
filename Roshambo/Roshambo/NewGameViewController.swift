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
        
        gameResultVC.playerChoice = self.playerChoice
        gameResultVC.randomValue = generateRandomValue()
        
        self.present(gameResultVC, animated: true, completion: nil)
    }
    
    func generateRandomValue() -> Int {
        let randomValue = 1 + arc4random() / 3
        return Int(randomValue)
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
            gameResultVC.playerChoice = self.playerChoice
            gameResultVC.randomValue = generateRandomValue()
        }
    }

}
