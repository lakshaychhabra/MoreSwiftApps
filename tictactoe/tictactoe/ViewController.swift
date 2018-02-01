//
//  ViewController.swift
//  tictactoe
//
//  Created by Lakshay Chhabra on 02/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playagainButtonLabel: UIButton!
    @IBOutlet weak var winLabel: UITextField!
    var activeGame = true
    var activePlayer = 1
    
    // 1 is O and 2 is X
    
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 -empty 1- Nought 2- cross
    
    let winningComb = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        winLabel.isHidden = true
        playagainButtonLabel.isHidden = true
        
        winLabel.center = CGPoint(x: winLabel.center.x - 500, y: winLabel.center.y)
        
        playagainButtonLabel.center = CGPoint(x: playagainButtonLabel.center.x - 500, y: playagainButtonLabel.center.y)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            gameState[activePosition] = activePlayer
                if activePlayer == 1{
                    sender.setImage(UIImage(named: "nought.png"), for: [])
                    activePlayer = 2
                }
                else{
                    sender.setImage(UIImage(named: "cross.png"), for: [])
                    activePlayer = 1
                }
            
            for combination in winningComb {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                   //win
                    activeGame = false
                    if gameState[combination[0]] == 1 {
                        winLabel.text = "Noughts Has Won"
                    }else{
                        winLabel.text = "Cross Has Won"
                    }
                    winLabel.isHidden = false
                    playagainButtonLabel.isHidden = false
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winLabel.center = CGPoint(x: self.winLabel.center.x + 500, y: self.winLabel.center.y)
                        self.playagainButtonLabel.center = CGPoint(x: self.playagainButtonLabel.center.x +  500, y: self.playagainButtonLabel.center.y)
                    })
                }
            }
            
            
      }
    }
    
    @IBAction func playAgainPressed(_ sender: Any) {
        
        winLabel.isHidden = true
        playagainButtonLabel.isHidden = true
        
        winLabel.center = CGPoint(x: winLabel.center.x - 500, y: winLabel.center.y)
        
        playagainButtonLabel.center = CGPoint(x: playagainButtonLabel.center.x - 500, y: playagainButtonLabel.center.y)
        
         activeGame = true
         activePlayer = 1
    
         gameState = [0,0,0,0,0,0,0,0,0]
        
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
                
            }
        }
        
    }
}

