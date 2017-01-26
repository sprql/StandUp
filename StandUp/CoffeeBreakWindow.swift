//
//  CoffeeBreakWindow.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Cocoa

class CoffeeBreakWindow : NSWindow {
    
    override var canBecomeKey: Bool {
        return true
    }
    
    override init(contentRect: NSRect, styleMask aStyle: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, defer: flag)
        
        self.styleMask = NSWindowStyleMask.borderless
        self.backgroundColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.7)
        self.level = Int(CGWindowLevelForKey(.overlayWindow))
        self.setFrame(frame, display: true)
        self.makeKeyAndOrderFront(nil)
        self.canHide = false
        self.isOpaque = false
        self.hasShadow = false
        self.collectionBehavior = [.stationary, .canJoinAllSpaces, .ignoresCycle]
    }
    
    override func keyDown(with theEvent: NSEvent) {
        if (theEvent.keyCode == 53) {
            (self.contentViewController as! CoffeBreakActions).quitAction()
        }
    }
}
