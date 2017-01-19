//
//  StatusMenuController.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Cocoa


class StatusMenuController: NSObject, StandUpTimerDelegate, NSWindowDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var stateMenuItem: NSMenuItem!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)

    let timestampFormatter = TimestampFormatter()
    
    let defaultWorkTime = 25*60
    
    var coffeeBreakWindow: CoffeeBreakWindow!
    var coffeeBreakViewController: CoffeeBreakViewController!
    
    let standUpTimer = StandUpTimer()
    
    override func awakeFromNib() {
        statusItem.image = NSImage(named: "statusItemIcon")
        statusItem.menu = statusMenu
        
        startWorkTimer()
    }
    
    @IBAction func quitAction(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
    
    func startWorkTimer() {
        standUpTimer.stop()
        standUpTimer.delegate = self
        standUpTimer.start(defaultWorkTime)
        standUpTimerUpdated(defaultWorkTime)
    }
    
    func standUpTimerAlarm() {
        let frame = NSScreen.main()!.frame
        
        coffeeBreakViewController = CoffeeBreakViewController()
        coffeeBreakViewController.view.frame = frame
        
        coffeeBreakWindow = CoffeeBreakWindow(contentViewController: coffeeBreakViewController)
        coffeeBreakWindow.delegate = self
        coffeeBreakWindow.setFrame(frame, display: true)
        coffeeBreakWindow.makeKeyAndOrderFront(nil)
    }
    
    func standUpTimerUpdated(_ time: Int) {
        stateMenuItem.title = timestampFormatter.timeStringFromTimestamp(time)
    }
    
    func windowWillClose(_ notification: Notification) {
        startWorkTimer()
    }
    
}
