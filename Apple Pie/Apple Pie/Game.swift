//
//  Game.swift
//  Apple Pie
//
//  Created by Steven Ybarra on 7/6/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import Foundation



struct Game {
    
    var word:String;
    var incorrectMovesRemaining:Int;
    //list of characters that the user has guessed;
    var guessedLetters:[Character];
    
    //computed property - reformats the word based on the guess;
    var formattedWord:String {
        var guessedWord = "";
        //loop through all the characters of the word to compare;
        for letter in word.characters {
            
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            }
            else {
                guessedWord += "_";
            }
        }
        return guessedWord;
    }
    
    
    
    
    //mutating function as it mutates a property value;
    mutating func playerGuessed(letter: Character) {
        //receives a character & adds the character to the collection of guessedLetters;
        guessedLetters.append(letter);
        print("current set of guessed letters: \(guessedLetters)")
        
        //update incorrectMovesRemaining if necessary;
        
        //if the word does not contain the letter character...
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1;
            print("incorrect! num moves remaining: \(incorrectMovesRemaining)")
        }
        
    }
}
