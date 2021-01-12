//
//  ViewController.swift
//  TicTacToeTest
//
//  Created by Briggitte Quintero Martinez on 2020-12-28.
//

import UIKit

var activePlayer = 1 //cross
var gameState = [0,0,0,0,0,0,0,0,0] // place on the board

let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
var gameIsActive = true


 

class ViewController: UIViewController {

    
    @IBOutlet weak var winningImage: UIImageView!
    @IBOutlet weak var label: UILabel!
   
    
    @IBAction func action(_ sender: UIButton) {
        
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(#imageLiteral(resourceName: "pinkX"), for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(#imageLiteral(resourceName: "aquaO"), for: UIControl.State())
                activePlayer = 1
            }
        }
        for combination in winningCombo{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                 
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    winningImage.image = #imageLiteral(resourceName: "pinkX")
                    label.text = "IS THE WINNER!"
                    
                }
                else{
                    winningImage.image = #imageLiteral(resourceName: "aquaO")
                    label.text = "IS THE WINNER!"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
                winningImage.isHidden = false
            }
            
        }
        if(gameIsActive == true){
            
          gameIsActive = false
          for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
          }
        if gameIsActive == false {
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playAgainButton.isHidden = false
            
        }
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        winningImage.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningImage.isHidden = true
        playAgainButton.isHidden = true
        label.isHidden = true
        
        // Do any additional setup after loading the view.
    }


}

