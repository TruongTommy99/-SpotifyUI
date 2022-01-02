//
//  ContentView.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @State  private var selection = 0
    var body: some View {
        
        TabView(selection: $selection){
            HomePage()
                .font(.largeTitle)
                .tabItem{
                    VStack{
                    Text("Home")
                        Image(systemName: "house")
                    }
                }
                .tag(0)
            
            SearchPage()
                .tabItem{
                    VStack {
                    Text("Library")
                        Image(systemName: "magnifyingglass")
                }
                }
                .tag(1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
