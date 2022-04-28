//
//  Timer.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 2/12/22.
//

import SwiftUI

struct musicTimer: View {
    @ObservedObject var timerManager = timeManager()
    @State var selectedPickerIndex = 0
    let availableMinute = [5,15,20,30,45,60]
    
    
    var body: some View {
        NavigationView {
            VStack{
                Text(secsToMins(secs:timerManager.secondsLeft))
                .font(.system(size: 40))
                .padding()
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.buttonColor)
                .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(
                            minutes: self.availableMinute[self.selectedPickerIndex]*60)
                    }
                    if (self.timerManager.timerMode == .running){
                    self.timerManager.pause()
                    }
                    else {
                        self.timerManager.start()
                    }
                })
                
                
                if timerManager.timerMode == .paused  {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top,40)
                        .onTapGesture {
                            self.timerManager.reset()
                        }
                }
                
                if timerManager.timerMode == .initial  {
                    Picker(selection: $selectedPickerIndex, label: Text("")){
                        ForEach(0..<availableMinute.count){
                            Text("\(self.availableMinute[$0]) minutes ")
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                }
                
            }
        }
        
    }
}

struct musicTimer_Previews: PreviewProvider {
    static var previews: some View {
        musicTimer()
    }
}

