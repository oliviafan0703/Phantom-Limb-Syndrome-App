//
//  Timer.swift
//  NewPhantomLimb
//
//  Created by Olivia Fan on 8/9/21.
//

import Foundation

class LateralityTimer {
    var secondsElapsed = 0.0
    var timer = Timer()
    
    //starts the timer
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func stop() {
         timer.invalidate()
         secondsElapsed = 0
     }
}
