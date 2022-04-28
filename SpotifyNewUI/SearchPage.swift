//
//  SearchPage.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/26/21.
//

import SwiftUI

struct SearchPage: View {
   //@ObservedObject var viewModel : SongList = SongList()
    @State private var searchText = ""
    var allCategories = ["Hip Hop","Rap","Pop","Jazz","K-POP","Blues"]
    
    var categories:[String:String] = ["Hip Hop":"blue", "Rap" : "red"]
    
    var body: some View {
        VStack{
        NavigationView {
            VStack(spacing: 20) {
                List {
                    ForEach(searchResults,id :\.self){ category_ in
                        Text(category_)
                    }
                }
            }
            .navigationTitle("Music")
            .searchable(text: $searchText,prompt: "What do you want to listen to?")
        }
        .frame(width: .infinity, height: 300)
            
                ScrollView{
                HStack{
                songCategoryBox(text: "Hip Hop", color: .blue)
                songCategoryBox(text: "Rap", color: .red)
                }
                HStack{
                songCategoryBox(text: "Pop ", color: .green)
                songCategoryBox(text: "Jazz", color: .pink)
                }
                HStack{
                    songCategoryBox(text: "K-POP", color: .brown)
                    songCategoryBox(text: "Blues", color: .teal)
                }
                }
        }

        
    }
    
    var searchResults:[String]{
        if allCategories.isEmpty {
            return allCategories
        }
        else {
            return allCategories.filter{ $0.contains(searchText)}
        }
    }
}




/*
struct EmptyStateView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 55))
                .padding(.bottom)
            Text("searching for music")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(.buttonColor)
    }
}
 
 */

/*
struct SearchBar : UIViewRepresentable {
        typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "What do you want to listen to?"
        return searchBar
    }
    func makeCoordinator() -> () {
        <#code#>
    }
}
 */





struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
            SearchPage()
                .previewInterfaceOrientation(.portrait)
    }
}
