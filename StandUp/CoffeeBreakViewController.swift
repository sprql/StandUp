//
//  CoffeeBreakViewController.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Cocoa

class CoffeeBreakViewController : NSViewController, StandUpTimerDelegate {
    let CoffeeBreakState = 1
    let WorkState = 2

    var currentState: Int!
    let defaultTimer = 5*60
    
    let startCoffeBreakHint = "KEEP\nCALM\nAND FILL\nTHE FORCE"
    let startWorkHint = "KEEP\nCALM\nAND USE\nTHE FORCE"
    
    let coffeeBreakTimer = StandUpTimer()
    let timestampFormatter = TimestampFormatter()
    
    @IBOutlet weak var timerField: NSTextField!
    @IBOutlet weak var closeButton: NSButton!
    @IBOutlet weak var breakImageView: NSImageView!
    @IBOutlet weak var hintTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        coffeeBreakTimer.stop()
        coffeeBreakTimer.delegate = self
        coffeeBreakTimer.start(defaultTimer)
        renderTimer(defaultTimer)
        initBreakState()
    }
    
    @IBAction func quitAction(_ sender: AnyObject) {
        if (currentState == WorkState) {
            self.view.window?.close()
        }
    }
    
    func initBreakState() {
        currentState = CoffeeBreakState
        closeButton.isHidden = true
        timerField.isHidden = false
        breakImageView.image = NSImage(named: "cup")
        hintTextField.stringValue = startCoffeBreakHint
    }
    
    func initWorkState() {
        currentState = WorkState
        closeButton.isHidden = false
        timerField.isHidden = true
        breakImageView.image = NSImage(named: "crown")
        hintTextField.stringValue = startWorkHint
    }
    
    
    func renderTimer(_ timer:Int) {
        timerField.stringValue = timestampFormatter.timeStringFromTimestamp(timer)
    }
    
    func standUpTimerAlarm() {
        renderTimer(0)
        initWorkState()
    }
    
    func standUpTimerUpdated(_ timer:Int) {
        renderTimer(timer)
    }
}
