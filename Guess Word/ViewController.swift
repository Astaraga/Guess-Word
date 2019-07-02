//
//  ViewController.swift
//  Guess Word
//
//  Created by TAPAN  RAUT on 03/07/19.
//  Copyright © 2019 TAPAN  RAUT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var wordToGuessLabe: UILabel!
    @IBOutlet weak var remainingGuessesLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var letterBankLabel: UILabel!
    
    // Create Array to hold hints and letters(need word to guess and word as under score variable)
    
    let LIST_OF_WORDS: [String] = []
    let LIST_OF_HINTS: [String] = []
    var wordToGuess: String!
    var wordUnderScores: String!
    let MAX_NUMBER_OF_GUESSES: Int = 5
    var guessRemaining: Int!
    
    // need some way randomize which word is being selected, then select theword and hint and display them
    
    //need way to keep track of number to guesses being used
    
    //  need way to guess letters and process wheather or not it is in the wordToGuess. If correct, display updated words as underscores . if incorrect decrement the number of guesses, add letters letter to letter bank and display letters guessed
    
    //lose game if runout of guesses
    
    //win game if guess every letters before running out of guesses(if words as underscscores contains no more underscores, the we win)

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        inputTextField.delegate = self
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
    }

    @IBAction func chooseNewWordAction(_ sender: UIButton) {
    }
    
    func chooseRandomNumbers() {
        
    }
    func processCorrectGuess() {
        
    }
    func processInCorrectGuess() {
        
    }
}

