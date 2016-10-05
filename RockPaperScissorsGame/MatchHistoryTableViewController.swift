//
//  MatchHistoryTableViewController.swift
//  RockPaperScissorsGame
//
//  Created by Norris Wise on 6/23/16.
//  Copyright © 2016 Norris Swift Sample Application. All rights reserved.
//

import Foundation
import UIKit

class MatchHistoryTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //import history data
    let historyTable = MatchHistoryDataModel.historyTable
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return historyTable.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        print ("row selected")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
      let cell = tableView.dequeueReusableCellWithIdentifier("GameHistoryRow")!

        let rowTitle = self.historyTable[indexPath.row][0]
      cell.textLabel?.text = rowTitle
        let detailTextTitle = self.historyTable[indexPath.row][1]
        cell.detailTextLabel?.text = detailTextTitle
        let imgTitle =  self.historyTable[indexPath.row][2]
                cell.imageView?.image = UIImage.init(named: imgTitle)
        print("--------- INSIDE CELL FOR ROW AT INDEX PATH ---------")
        print(rowTitle)
        print(detailTextTitle)
        print(imgTitle)
        print("--------- END CELL FOR ROW AT INDEX END ---------")
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Match History"
    }
    override func setEditing(editing: Bool, animated: Bool) {
        setEditing(false, animated: false)
    }
    
    
    @IBAction func deleteGameHistory()
    {
        
        MatchHistoryDataModel.historyTable.removeAll()
        let me = storyboard?.instantiateViewControllerWithIdentifier("MatchHistoryTableViewController")
        self.presentViewController(me!, animated: false, completion: nil)
        
    
    }
    
  
}
