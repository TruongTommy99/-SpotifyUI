//
//  HomePage.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/26/21.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
        Text("Spotify, college edition!")
                .font(.title)
                .bold()
        MusicPlayer()
                .frame(width: 300, height: 160)
                .cornerRadius(10)
        musicTimer()
        }
        .padding()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
