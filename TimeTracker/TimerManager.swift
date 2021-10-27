//
//  TimerManager.swift
//  ExampleTimer
//
//  Created by Sun on 21/10/2021.
//

import Foundation

protocol TimerManagerType {
    func resetTimer(screenName: String)
    func stopTimer(screenName: String)
}

final class TimerManager: TimerManagerType {
    
//    static let shared = TimerManager()
    var timer = Timer()
    var countTime = 0
    
    init() { }
    
    @objc private func startTimer() {
        countTime += 1
        print("---- debug count time = ", countTime)
    }
    
    func resetTimer(screenName: String) {
        print("\n---- debug at \(screenName) ---- Start count time = ", countTime)
        countTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(screenName: String) {
        timer.invalidate()
        print("---- debug at \(screenName) ---- Final count time = ", countTime)
    }
}
