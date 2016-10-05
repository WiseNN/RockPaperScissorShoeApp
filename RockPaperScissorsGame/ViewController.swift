//
//  ViewController.swift
//  RockPaperScissorsGame
//
//  Created by Norris Wise on 6/18/16.
//  Copyright © 2016 Norris Swift Sample Application. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    //Buttons
    @IBOutlet weak var rockButtom: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var gameHistoryButton : UIButton!

    var firstController : ViewController!
    let myDataModel  = DataModel()
    var tableHistoryViewController : MatchHistoryTableViewController!

    override func viewDidLoad()
    {
        setupButtons()
     }
    
    func setupButtons()
    {
        rockButtom.tag = 1
        paperButton.tag = 2
        scissorsButton.tag = 3
        gameHistoryButton.addTarget(self, action: #selector(ViewController.presentHistoryTableViewController), forControlEvents: UIControlEvents.TouchUpInside)
    }
    


   
    @IBAction func playGame(sender : UIButton, controlla2 : ResultsViewController?)
    {
       myDataModel.buttonTag = sender.tag
       myDataModel.letsPlay()
        switch(sender.tag)
        {
            case 1 :
            let controlla : ResultsViewController!
            controlla = storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as? ResultsViewController
                self.presentViewController(controlla!, animated: true, completion: nil)
                    break
            case 2 :
                self.performSegueWithIdentifier("transitionSegue", sender: paperButton)
                    break
            default:
                    break
        }
    }
    
    func presentHistoryTableViewController()
    {
        tableHistoryViewController = storyboard?.instantiateViewControllerWithIdentifier("MatchHistoryTableViewController") as! MatchHistoryTableViewController
        self.presentViewController(tableHistoryViewController, animated:  true, completion:  nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "letsPlay")
        {
            myDataModel.buttonTag = sender!.tag
            myDataModel.letsPlay()
            print("Prepare for segue has been called!")
            segue.destinationViewController as! ResultsViewController
        }
    }
    
    
}

