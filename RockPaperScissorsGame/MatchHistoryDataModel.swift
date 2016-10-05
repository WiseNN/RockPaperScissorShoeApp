//
//  MatchHistoryDataModel.swift
//  RockPaperScissorsGame
//
//  Created by Norris Wise on 6/24/16.
//  Copyright © 2016 Norris Swift Sample Application. All rights reserved.
//

import Foundation

class MatchHistoryDataModel
{
    //passed in values
    var YouWon = false
    var YouTied = false
    var user = ""
    var computer = ""
    //----------
    
    
    var count = 0
    var x = tableRowInfo()
    static var historyTable = [[String]]()

    struct tableRowInfo {
        var whoWon = ""
        var whoPlayed = ""
        var whoWonImage = ""
        var gameCount : Int = 0
       
    }
    func updateTable()
    {
        processResults()
        pushData()
        printTable()
    }
    
    
    func processResults()
    {
        if(YouWon)
        {
            x.whoWon = "Winner"
            x.whoPlayed =  user+" V "+computer
            x.whoWonImage = "Winer_img"
            x.gameCount = ++count
        }
        else if(YouTied)
        {
            x.whoWon = "Tie"
            x.whoPlayed = user+" V "+computer
            x.whoWonImage = "Tie_img"
            x.gameCount = ++count
        }
        else
        {
            x.whoWon = "Looser"
            x.whoPlayed = user+" V "+computer
            x.whoWonImage = "Loser_img"
            x.gameCount = ++count
        }

    }
    
    func pushData()
    {
         var rowInfo = [String]()
        rowInfo.append(x.whoWon)
        rowInfo.append(x.whoPlayed)
        rowInfo.append(x.whoWonImage)
        rowInfo.append(String(x.gameCount))
        MatchHistoryDataModel.historyTable.append(rowInfo)
    }
    
    func printTable()
    {
        print("---- Hello from history table ------")
        print(MatchHistoryDataModel.historyTable)
        print("---- GoodBye! from history table ------")
    }
    
}

