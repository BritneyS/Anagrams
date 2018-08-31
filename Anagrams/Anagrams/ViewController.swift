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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

