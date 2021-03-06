//
//  ContentView.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @State  private var selection = 0
    // ideas for views
    // student music player : Music player + timer
    // normal music player with search bar
    // share player ?
    
    
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
            // add timer? 
            
            SearchPage()
                .tabItem{
                    VStack {
                    Text("Search")
                        Image(systemName: "magnifyingglass")
                }
                }
                .tag(1)
            
            ContentItemViewer()
                .tabItem{
                    VStack {
                        Text("Library")
                            Image(systemName: "books.vertical.fill")
                    }
                }
                .tag(2)
            // add the back to home button
            // fetch from API
            //add logos ?
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
