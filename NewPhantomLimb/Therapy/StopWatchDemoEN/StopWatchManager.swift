//
//  StopWatchManager.swift
//  StopWatchDemoEN
//
//  Created by Farukh IQBAL on 13/06/2020.
//  Copyright © 2020 Farukh Academy. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var mode: stopWatchMode = .stopped
    
    @Published var secondsElapsed = 0.0
    @Published var ifCompleted = false
    
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondsElapsed += 1.0
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
    func convertSecondsToTime(timeInSeconds : Int) ->
    String {
        let minutes = timeInSeconds/60
        let seconds = timeInSeconds % 60
        if (timeInSeconds>7200){
            ifCompleted = true
        }
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
}
