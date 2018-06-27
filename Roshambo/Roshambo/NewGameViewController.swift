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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockButtonPressed(_ sender: Any) {
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
    }
    
}

