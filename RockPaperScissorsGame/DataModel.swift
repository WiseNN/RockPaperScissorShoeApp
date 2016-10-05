//
//  DataModel.swift
//  RockPaperScissorsGame
//
//  Created by Norris Wise on 6/23/16.
//  Copyright © 2016 Norris Swift Sample Application. All rights reserved.
//

import Foundation

class DataModel
{
    
    //instance Variabled
    let matchHistoryData = MatchHistoryDataModel()
    var buttonTag = 0
    
    struct randomNums
    {
        static var num1 : UInt32 = 1
        static var num2 : UInt32 = 0
        static var wildCard : UInt32 = 15
    }
    
    func letsPlay()
    {
        let tieCase = getRandomNum()
        getMatchUpAndResults(tieCase)
       matchHistoryData.updateTable()
        
    }
    
    
    func getRandomNum() -> Bool
    {
        
        randomNums.num1 = arc4random_uniform(2)
        randomNums.wildCard = arc4random_uniform(21)
        
        switch(randomNums.num1)
        {
        case 0 :
            randomNums.num2 = 1
        default :
            randomNums.num2 = 0
        }
        let tieCase = (randomNums.wildCard <= 5)
        
        print("num1: \(randomNums.num1)")
        print("num2: \(randomNums.num2)")
        print("tieCase: \(tieCase)")
        print("-------------------------------------")
        return tieCase
    }
    
    func getMatchUpAndResults(checkForTie : Bool)
    {
        let boolTest = (randomNums.num1 == 1)
        let user : String!
        var computer : String!
        switch(buttonTag)
        {
        case 1 :
            user = "Rock"
            if(boolTest)
            {
                computer="Paper"
                ResultsViewController.resultsImagePath = "r1-p1-s0"
                ResultsViewController.resultsLabelStr = "Sorry...You Loose"
                matchHistoryData.YouWon = false
                
                //YOU LOOSE
            }
            else
            {
                computer="Scissors"
                ResultsViewController.resultsImagePath = "r1-p0-s1"
                ResultsViewController.resultsLabelStr = "You Win!"
                matchHistoryData.YouWon = true
                //YOU WIN
            }
            
        case 2 :
            user = "Paper"
            if(boolTest)
            {
                computer="Rock"
                ResultsViewController.resultsImagePath = "r1-p1-s0"
                ResultsViewController.resultsLabelStr = "You Win!"
                matchHistoryData.YouWon = true
                //YOU WIN
            }
            else
            {
                computer="Scissors"
                ResultsViewController.resultsImagePath = "r0-p1-s1"
                ResultsViewController.resultsLabelStr = "Sorry...You Loose"
                matchHistoryData.YouWon = false
                //YOU LOOSE
            }
        case 3 :
            user = "Scissors"
            if(boolTest)
            {
                computer="Rock"
                ResultsViewController.resultsImagePath = "r1-p0-s1"
                ResultsViewController.resultsLabelStr = "Sorry...You Loose"
                matchHistoryData.YouWon = false
                //YOU LOOSE
            }
            else
            {
                computer="Paper"
                ResultsViewController.resultsImagePath = "r0-p1-s1"
                ResultsViewController.resultsLabelStr = "You Win!"
                matchHistoryData.YouWon = true
                //YOU WIN
            }
            
        default : return
        }
        if(checkForTie)
        {
            computer = user
            ResultsViewController.resultsImagePath = "r0-p0-s0"
            ResultsViewController.resultsLabelStr = "Its A Tie!"
            matchHistoryData.YouTied = true
            
        }
        matchHistoryData.user = user
        matchHistoryData.computer = computer
        let matchUp = user+" vs "+computer
        ResultsViewController.matchUpLabelStr = matchUp
    
        
    }

}