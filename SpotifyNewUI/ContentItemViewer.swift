//
//  ContentItemViewer.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/26/21.
//

import SwiftUI

struct ContentItemViewer: View {
    @State private var showingSearchScreen = false
    var topSpacer_height:CGFloat = 375
    @State var playButton_offset:CGFloat = 400
    var reusableColor = Color.init(red: 61/255, green: 89/255, blue: 115/255)
    
    var body: some View {
        
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 18/255, green: 200/255, blue: 80/255),.black,.black]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            //Layer 1
            VStack /* Image logo + title + subtitle */ {
                Spacer()
                    .frame(height: 50)
                Image("edsheeran_album")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Thinking Out Loud")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                Text("Ed Sheeran")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                
                Spacer()
            }
            
          // Layer 2
                ScrollView{
                    
                    GeometryReader{ geo -> AnyView? in
                        let thisOffset = geo.frame(in: .global).minY
                        if thisOffset > -300 {
                            self.playButton_offset = thisOffset
                        }
                        else {
                            self.playButton_offset = -300
                        }

                        return nil
                    }
                    
                    
                    VStack(spacing: 0){
                HStack {
                    Spacer()
                        .frame( height: topSpacer_height)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear,.clear,.clear,.clear,.black]), startPoint: .top, endPoint: .bottom))
                }
                
                        
         // List of songs
                    VStack {
                    ForEach (0..<30) { indicator in
                        HStack {
                            Limage_text_rImage()
                        }
                    }
                    }.background(.black)
                    }
                    .background(.clear)
                        
            }
            
            // inbetween
            VStack{
                LinearGradient(gradient: Gradient(colors: [reusableColor,Color.clear]),
                               startPoint: .top, endPoint: .bottom)
                    .frame(height:200)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            /* Layer 3 : Button Play */
            VStack   {
                Spacer()
                    .frame(height:playButton_offset + 275)
                
                HStack {
                if playButton_offset > -300 {
                    Text("Play")
                }
                else {
                         Image(systemName: "play.fill")
                    }
                }
                    .foregroundColor(.white)
                    .frame(width: get_playButtonWidth(), height: 50)
                    .background(Color.init(red: 30/255, green: 215/255, blue: 96/255))
                    .cornerRadius(25)
                .font(.system(size: 20, weight: .bold))
                .shadow(radius: 20)
                
                Spacer()
                }
            
            //Final Layer - the Back to menu button
            VStack {
                HStack{

                Image(systemName: "chevron.left")
                        .onTapGesture {
                             showingSearchScreen = true
                            print("OK")
                        }
                        
                Spacer()
                Image(systemName: "ellipsis")
                }.foregroundColor(.white)
                    .padding()
                Spacer()
            }
            
            }
       
        
              
                
       
        
        
            
        
        
        }
    
    func get_playButtonWidth() -> CGFloat {
        if playButton_offset > -150 { return 240 }
        else if playButton_offset <= -300 { return  50}
        else {
            let width:CGFloat = 240 - (190*(((-1*playButton_offset)-150)/150))
            return width
        }
    }
    }

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
