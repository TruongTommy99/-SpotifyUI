//
//  MusicPlayer.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 2/5/22.
//

import SwiftUI
import AVKit


struct MusicPlayer: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    var body: some View {
        
        ZStack {
            Color.bgColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
            Text("Listen to Music!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.buttonColor)
                }
                HStack{
                    Spacer()
                    Button(action:{
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.buttonColor)
                    }
                    Spacer()
                    Button(action:{
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.buttonColor)
                    }
                    Spacer()
                    Button(action:{
                        if self.count < 2 {
                            self.count += 1
                        }
                        else {
                            self.count = 1
                        }
                        
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "forward.end")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.buttonColor)
                    }
                    Spacer()
                
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
