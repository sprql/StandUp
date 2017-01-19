//
//  TimestampFormatter.swift
//  StandUp
//
//  Created by Alexander Obukhov on 18/01/2017.
//  Copyright © 2017 sprql. All rights reserved.
//

import Cocoa

class TimestampFormatter: NSObject {
    func timeStringFromTimestamp(_ timestamp: Int) -> String {
        let minutes = timestamp / 60
        let seconds = timestamp % 60
        
        return zerroPadding(minutes) + ":" + zerroPadding(seconds)
    }
    
    fileprivate func zerroPadding(_ value:Int) -> String {
        if(value < 10) {
            return "0" + String(value)
        } else {
            return String(value)
        }
    }
}
