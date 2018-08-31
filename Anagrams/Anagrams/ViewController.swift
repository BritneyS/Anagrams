//
//  ViewController.swift
//  Anagrams
//
//  Created by Britney Smith on 8/31/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//
/*
 Challenge #1
 
 Build an iOS app that allows the user to play an anagram game. When the game begins, a word should be displayed on the screen, and the user must come up with words that can be made out of the letters in the displayed word. For the purposes of this exercise, you can display the same word each time the game is played.
 
 When the user enters a word that can be created using the letters in the displayed word, your app should display an alert telling them they’ve scored 1 point. If the user enters a word that cannot be created using the letters in the displayed word, your app should display an alert telling them they’ve lost 1 point.
 
 Bonus: Your app should display a different, randomly-selected word each time the game is played. Once the user is finished guessing anagrams for a displayed word, they can press a “Next Word” button and get a new word.
 
 Important Notes:
 Your app does not need to track whether or not the user finds all the anagrams for a particular displayed word. It simply needs to check if the word guessed by the user can be created using the letters in your displayed word.
 Your app may, but is not required to include score tracking and game reset functionality

 */
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var checkAnagramButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var isAnagramDisplayLabel: UILabel!
    
    var word = "cider" // cried, ride, dice
    var isAnagram = false
    var score = 0
    var charMatch = 0
    var usedLetters:[String:Int] = ["c":0,
                                    "i":0,
                                    "d":0,
                                    "e":0,
                                    "r":0]

    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = self.word
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkGuess(guess:String) {
        
        var wordArr:[String] = []
        //convert word to array
        for letter in word {
            wordArr.append(String(letter))
        }
        //check anagram char by char
        for char in guess {
            
            if wordArr.contains(String(char)) {
                updateUsedLetters(letter: String(char))
                checkUsedLetters(letter: String(char))
            }
        }
       
        updateScore(anagramCheck: checkMatch(matchCount: charMatch, guess: guess))
        
    }
    
    
    //checks for duplicates, if match is found
    func updateUsedLetters(letter:String){
        for key in usedLetters.keys {
            if letter == key {
                if usedLetters[key] != nil {
                    usedLetters[key]!+=1 //looked up how to access values in key-value pairs
                }
            }
        }
    }
    
    func checkUsedLetters(letter:String){
        for (key, value) in usedLetters {
            if letter == key {
                if value == 1 {
                    charMatch+=1
                } else {
                    charMatch-=1
                }
            }
        }
    }
    
    func checkMatch(matchCount:Int, guess:String) -> Bool {
        if matchCount == guess.count {
            isAnagram = true
        } else {
            isAnagram = false
        }
        return isAnagram
    }
    
    func newGuess(){
        guessTextField.text = ""
        charMatch = 0
        for key in usedLetters.keys {
            usedLetters[key] = 0
        }
    }
    
    func isAnagramDisplay(anagramCheck:Bool) {
        //looked up alert specifics
        if anagramCheck {
            
            let alert = UIAlertController(title: "Is an Anagram!", message: "You get 1 point!😃", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            
            let alert = UIAlertController(title: "NOT an Anagram!", message: "You lose 1 point!😢", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func updateScore(anagramCheck:Bool) {
        if anagramCheck {
            isAnagramDisplay(anagramCheck: anagramCheck)
            score+=1
            scoreLabel.text = "Score: \(score)"
        } else {
            isAnagramDisplay(anagramCheck: anagramCheck)
            score-=1
            scoreLabel.text = "Score: \(score)"
        }
    }
    @IBAction func checkAnagram(_ sender: UIButton) {
        guard let guess = guessTextField.text else {
            print("No data")
            return
        }
        //checks for empty input
        if guess.isEmpty || guess == "" {
            isAnagram = false
            updateScore(anagramCheck: isAnagram)
        } else {
            checkGuess(guess: guess)
        }
        newGuess()
    }
    

}

