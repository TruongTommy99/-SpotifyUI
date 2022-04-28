//
//  Extensions.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 2/2/22.
//
import Foundation
import SwiftUI


extension Color {
    static func rgb(r:Double, g:Double, b:Double) ->Color {
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    
    static let  bgColor = Color.rgb(r: 210, g: 220, b: 23)
    static let buttonColor = Color.rgb(r: 15, g: 100, b: 25)
}


//TIMER
enum TimerMode {
    case initial
    case running
    case paused
}

class timeManager : ObservableObject {
    @Published var timerMode : TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    
    func setTimerLength(minutes:Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true,block:  { timer in
            if self.secondsLeft == 0  {
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    
}


func secsToMins(secs:Int)-> String {
    let minute = "\((secs%3600)/60)"
    let seconds = "\((secs%3600)%60)"
    let minuteStamp = minute.count > 1 ? minute : "0" + minute
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minuteStamp) : \(secondStamp)"
}


