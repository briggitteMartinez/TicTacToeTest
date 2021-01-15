//
//  ViewController.swift
//  TicTacToeTest
//
//  Created by Briggitte Quintero Martinez on 2020-12-28.
//

import UIKit

var activePlayer = 1 //cross
var gameState = [0,0,0,0,0,0,0,0,0] // place on the board

let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]] //winning combinations
var gameIsActive = true // keeps track if game is finished, winner or draw




class ViewController: UIViewController {
    
    
    @IBOutlet weak var winningImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func action(_ sender: UIButton) { // action is called when you press button on board
        
        //check if empty space on board & if game is active
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            
            gameState[sender.tag-1] = activePlayer // change gameStates 0 to activePlayer 1 or 2
            
            if (activePlayer == 1){
                sender.setImage(#imageLiteral(resourceName: "pinkX"), for: UIControl.State()) // add image to button in klicked gameState position
                activePlayer = 2 // change turn of activePlayer
            }
            else {
                sender.setImage(#imageLiteral(resourceName: "aquaO"), for: UIControl.State())
                activePlayer = 1
            }
        }
        for combination in winningCombo{ // check if there is a winner, check if there are the same numbers in each of the winningcombo arrays positions in gamestate
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                print(combination)
                gameIsActive = false // game is over

                //check who has won
                if gameState[combination[0]] == 1 {
                    winningImage.image = #imageLiteral(resourceName: "pinkX")
                    label.text = " X IS THE WINNER!"
                    
                }
                else{
                    winningImage.image = #imageLiteral(resourceName: "aquaO")
                    label.text = "O IS THE WINNER!"
                }
                //display hidden buttons
                playAgainButton.isHidden = false
                label.isHidden = false
                winningImage.isHidden = false
            }
            
        }
        if(gameIsActive == true){
            //check if board(gameState) still has 0
            gameIsActive = false
            for i in gameState {
                if i == 0 {
                    gameIsActive = true
                    break
                }
            }
            //if there is no 0 left in board(gameState) and no winner
            if gameIsActive == false {
                label.text = "IT´S A TIE"
                winningImage.isHidden = false
                winningImage.image = #imageLiteral(resourceName: "tie")
                label.isHidden = false
                playAgainButton.isHidden = false
                
            }
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) { // reset the gameState when klicked
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        //hide buttons and labels
        playAgainButton.isHidden = true
        label.isHidden = true
        winningImage.isHidden = true
        
        //remove images from buttons on board(gameState)
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

