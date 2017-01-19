//
//  StandUpTimer.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Foundation

protocol StandUpTimerDelegate {
    func standUpTimerUpdated(_ time:Int)
    func standUpTimerAlarm()
}

class StandUpTimer : NSObject {
    var time = 0
    var delegate: StandUpTimerDelegate!
    var timer: Timer!
    
    func start(_ startFrom:Int) {
        time = startFrom
        if(time > 0) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(StandUpTimer.decrement), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func decrement() {
        time -= 1
        delegate.standUpTimerUpdated(time)
        if (time <= 0) {
            delegate.standUpTimerAlarm()
            stop()
        }
    }
}
