//
//  SongList.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 4/25/22.
//

import Foundation
import SwiftUI
import Combine

class SongList : ObservableObject {
    @Published var searchTerm : String = ""
    @Published public private(set) var songs = [SongViewModel]()
    
    private let dataModel = DataModel()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $searchTerm.sink(receiveValue: loadSongs(searchTerm:))
            .store(in: &disposables)
        
    }
    
    private func loadSongs(searchTerm : String ) {
        songs.removeAll()
        
        dataModel.loadSongs(searchTerm: searchTerm){songs in
            songs.forEach{self.appendSong(song:$0)}
        }
    }
    
    private func appendSong(song:Song) {
        let songViewModel = SongViewModel(song: song)
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
    }
    
    
}




class SongViewModel : Identifiable , ObservableObject {
    let id : Int
    let trackName : String
    let artistName : String
    @Published var artwork : Image?
    
    init(song:Song) {
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
    }
    
}
