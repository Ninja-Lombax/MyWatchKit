//
//  InterfaceController.swift
//  MyWatchKit WatchKit Extension
//
//  Created by John Grasser on 2/26/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var lblLifeTotal: WKInterfaceLabel!
    
    @IBOutlet var edhLife: WKInterfaceButton!
    
    var lifeTotal = 20
    let lifeTotalDefault = 20
    let edhLifeTotalDefault = 40
    var edhLives = 1
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        edhLife.setTitle("EDH Life")
        
    }
    
    @IBAction func btnLifeUp() {
        lifeTotal = lifeTotal + 1
        showLife()
    }
    
    
    @IBAction func btnLifeDown() {
        lifeTotal = lifeTotal - 1
        showLife()
    }
    
    
    @IBAction func btnResetLife() {
        if edhLives == 0
        {
        
            lifeTotal = edhLifeTotalDefault
            edhLife.setTitle("Standard Life")
        
        }
        else
        {
            lifeTotal = lifeTotalDefault
            edhLife.setTitle("EDH Life")
            
        }
        
        showLife()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func showLife()
    {
        let stringLifeTotal:String = String(lifeTotal)
        lblLifeTotal.setText("Your life total is: \(stringLifeTotal)")
        checkLifeTotal()
    }

    func checkLifeTotal()
    {
        
        if lifeTotal <= 0
        {
            lblLifeTotal.setText("You lost the game")
            
        }
    
    }
    
    
    @IBAction func edhHealthToggle()
    {
        
        if edhLives == 0
        {
            edhLives = 1
            //lifeTotal = edhLifeTotalDefault
            
            
            
        }
        else{
            edhLives = 0
            //lifeTotal = lifeTotalDefault
           
            
            
        }
        
        btnResetLife()
        showLife()
        
    }
    
    
}
