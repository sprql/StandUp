//
//  StatusMenuController.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Cocoa

//WatchrTimerDelegate
class StatusMenuController: NSObject, NSWindowDelegate {
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
//    let watchrTimer = WatchrTimer()
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var stateMenuItem: NSMenuItem!
    
//    let timestampFormatter = TimestampFormatter()
    
    let defaultWorkTime = 25*60
    
//    var coffeeBreakWindow: CoffeeBreakWindow!
//    var coffeeBreakViewController: CoffeeBreakViewController!
    
    override func awakeFromNib() {
        statusItem.image = NSImage(named: "statusItemIcon")
        statusItem.menu = statusMenu
        
        startWorkWatchr()
    }
    
    func startWorkWatchr() {
//        watchrTimer.stop()
//        watchrTimer.delegate = self
//        watchrTimer.start(defaultWorkTime)
//        watchrUpdated(defaultWorkTime)
    }
    
    
    //MARK: WatchrTimerDelegate
    func watchrAlarm() {
        let frame = NSScreen.main()!.frame
        
//        coffeeBreakViewController = CoffeeBreakViewController()
//        coffeeBreakViewController.view.frame = frame
//        
//        coffeeBreakWindow = CoffeeBreakWindow(contentViewController: coffeeBreakViewController)
//        coffeeBreakWindow.delegate = self
//        coffeeBreakWindow.setFrame(frame, display: true)
//        coffeeBreakWindow.makeKeyAndOrderFront(nil)
    }
    
    func watchrUpdated(_ time: Int) {
//        stateMenuItem.title = timestampFormatter.timeStringFromTimestamp(time)
    }
    
    func windowWillClose(_ notification: Notification) {
        startWorkWatchr()
    }
}
