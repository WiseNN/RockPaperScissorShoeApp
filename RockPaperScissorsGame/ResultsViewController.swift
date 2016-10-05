//
//  TieViewController.swift
//  RockPaperScissorsGame
//
//  Created by Norris Wise on 6/18/16.
//  Copyright © 2016 Norris Swift Sample Application. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController : UIViewController
{
    @IBOutlet var myView: UIView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var resultsLabel: UILabel?
    @IBOutlet weak var resultsImage: UIImageView?
    @IBOutlet weak var matchUp: UILabel!
    
    //static variables
    static var currentImage: UIImage = UIImage()
    static var resultsImagePath : String!
    static var resultsLabelStr : String!
    static var matchUpLabelStr : String!    
    
    override func viewDidLoad()
    {
        showResults()
        
    }
   
    
    func showResults()
    {  
        matchUp?.text = ResultsViewController.matchUpLabelStr
        resultsImage?.image = UIImage.init(named: ResultsViewController.resultsImagePath)
        resultsLabel?.text = ResultsViewController.resultsLabelStr
    }
}