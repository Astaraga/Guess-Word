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
    
    let LIST_OF_WORDS: [String] = ["GoodMorning", "GoodBye", "NandanKanan", "KarlMax"]
    let LIST_OF_HINTS: [String] = ["Greetings", "FireWell", "Safali in Odisha", "Creator of Maxism"]
    var wordToGuess: String!
    var wordUnderScores = ""
    let MAX_NUMBER_OF_GUESSES = 5
    var guessRemaining: Int!
    var oldRandomNumbers = 0
    
    // need some way randomize which word is being selected, then select theword and hint and display them
    
    //need way to keep track of number to guesses being used
    
    //  need way to guess letters and process wheather or not it is in the wordToGuess. If correct, display updated words as underscores . if incorrect decrement the number of guesses, add letters letter to letter bank and display letters guessed
    
    //lose game if runout of guesses
    
    //win game if guess every letters before running out of guesses(if words as underscscores contains no more underscores, the we win)

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        inputTextField.delegate = self
    }

    


    @IBAction func chooseNewWordAction(_ sender: UIButton) {
        reset()
        var index = chooseRandomNumbers()
        wordToGuess = LIST_OF_WORDS[index]
        wordToGuessLabe.text = wordToGuess
        let hints = LIST_OF_HINTS[index]
        hintLabel.text = "hint \(hints), \(wordToGuess.count) number of letters"
        for _ in 1...wordToGuess.count{
            wordUnderScores.append("_")
        }
        wordToGuessLabe.text = wordUnderScores
        
        
    }
    
    func reset() {
        
        guessRemaining = MAX_NUMBER_OF_GUESSES
        remainingGuessesLabel.text = "\(String(describing: guessRemaining!)) guesses left"
        
        wordUnderScores = ""
        letterBankLabel.text?.removeAll()
        inputTextField.text?.removeAll()
        inputTextField.isEnabled = true
    }
    
    func chooseRandomNumbers() -> Int {
        var newRandomNumbers = arc4random_uniform(UInt32(LIST_OF_WORDS.count))
        
        if newRandomNumbers == oldRandomNumbers{
            
            newRandomNumbers = UInt32(chooseRandomNumbers())
        }
        else{
            oldRandomNumbers = Int(newRandomNumbers)
        }
        return Int(newRandomNumbers)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let letterGuessed = textField.text else {
            return
        }
        
        inputTextField.text?.removeAll()
        
        var currentLetterBank = letterBankLabel.text ?? ""
        
        if currentLetterBank.contains(letterGuessed){
            return
        }
        else{
        if wordToGuess.contains(letterGuessed){
            processCorrectGuess(letterGuessed: letterGuessed)
            
        }
        else{
            processInCorrectGuess()
        }
            letterBankLabel.text?.append("\(letterGuessed), ")
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    
    func processCorrectGuess(letterGuessed: String) {
        
        let characterGuessed = Character(letterGuessed)
        
        for index in wordToGuess.indices{
            if wordToGuess[index] == characterGuessed{
                let endIndex = wordToGuess.index(after: index)
                let characterRange = index..<endIndex
                    wordUnderScores = wordUnderScores.replacingCharacters(in: characterRange, with: letterGuessed)
                
                wordToGuessLabe.text = wordUnderScores
                }
            }
        if !wordUnderScores.contains("_"){
            remainingGuessesLabel.text = "You win! "
            
            inputTextField.isEnabled = false
        }
        }
    
   
    func processInCorrectGuess() {
        
      guessRemaining! -= 1
        
        if guessRemaining == 0{
            inputTextField.isEnabled = false
            remainingGuessesLabel.text = "You lose! "
        }
        else{
          remainingGuessesLabel.text = "\(guessRemaining!) guesses left"
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = NSCharacterSet.letters
        let startingLength = textField.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        if string.isEmpty{
            return true
        }
        else if newLength == 1{
            
            if let _ = string.rangeOfCharacter(from: allowedCharacters, options: .caseInsensitive){
                return true
            }
        }
        return false
    }
}

