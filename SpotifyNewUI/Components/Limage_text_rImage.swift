//
//  Limage_text_rImage.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 12/30/21.
//

import SwiftUI

struct Limage_text_rImage: View {
    var body: some View {
        HStack {
            Image(systemName: "timelapse")
                .padding(.trailing,10)
            Text("title of the song")
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(15)
        .background(.black)
        .foregroundColor(.white)
    }
}

struct Limage_text_rImage_Previews: PreviewProvider {
    static var previews: some View {
        Limage_text_rImage()
    }
}
