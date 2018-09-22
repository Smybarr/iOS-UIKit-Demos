//
//  ViewController.swift
//  Apple Pie
//
//  Created by Steven Ybarra on 7/6/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    //need to have the sender as type UIButton in order
    //to access the title of the button that called this
    //method;
    @IBAction func buttonPressed(_ sender: UIButton) {
        //whenever a letter button is tapped, it should become disabled (1 letter per turn);
        print("Button Pressed");
        sender.isEnabled = false;
        
        //get the title of the sender - this will be the letter of the button; ! assures compiler that it will work;
        let letterString = sender.title(for: .normal)!
        
        //convert the title to a lowercase letter character;
        let letter = Character(letterString.lowercased())
        print("letter guessed: \(letter)\n")
        //communicates the button information to Game struct, where this method checks if the letter is correct;
        currentGame.playerGuessed(letter: letter)
        
        //need to update the game state based on the input;
        updateGameState()
    }
    
    func updateGameState() {
            //if the player runs out of chances, add to totalLosses;
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1;
        }
            //if the player guesses the word right, add to totalWins;
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1;
        }
            //otherwise just update the game UI and continue
        else {
            updateUI()
        }
    }
    
    func newRound() {
        //if the list of possible words to guess is NOT empty;
        if !listOfWords.isEmpty {
            
            //select a new word;
            let newWord = listOfWords.removeFirst();
            print("\nNew round started! new word: \(newWord)")
            
            //initialize a new game with newWord and incorrectMovesAllowed, which = 7;
            currentGame = Game(word: newWord, incorrectMovesRemaining:incorrectMovesAllowed, guessedLetters: [])
            
            //re-enable the buttons for reuse in the new round;
            enableLetterButtons(true);
            
            //update/reset the UI visuals;
            updateUI()
        }
        else {
            //otherwise disable all the letters;
            enableLetterButtons(false);
            
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            //enable is a bool value, so set the bool value of isEnabled property to = enable arg;
            button.isEnabled = enable
        }
    }
    
    
    
    func updateUI() {
        //put all the characters in the formatted word 
        //in a new list of string characters
        var letters = [String]()
    
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        
        //take the new list of string characters and separate by " "
        let wordWithSpacing = letters.joined(separator: " ")
        
        //update the word label based on the last guess;
        correctWordLabel.text = wordWithSpacing;
        
        
        //update the score label;
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        //update the tree image; UIImage(named: "<imageName>")
        //images are named Tree 1, Tree 2, Tree 3, etc; number corresponds with number of moves remaning;
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    
    
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //player can fuck up 7 times, as there are only 7
    //different images of the tree representing remaining
    //apples;
    let incorrectMovesAllowed = 7;
    
    var currentGame:Game!
    
    var totalWins = 0 {
        //if you didSet (change) totalWins, start a new round;
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        //if you didSet (change) totalLosses, start a new round;
        didSet {
            newRound()
        }
    }
    
    
    var listOfWords:[String] = ["food", "butt", "sharks", "beers", "bananas", "pirates"];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize the game to immediately start a new round();
        newRound()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

