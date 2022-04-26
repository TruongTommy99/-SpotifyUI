//
//  songCategoryBox.swift
//  SpotifyNewUI
//
//  Created by Truong Tommy on 4/25/22.
//

import SwiftUI

struct songCategoryBox: View {
    @State var text:String
    @State var color:Color
    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(color)
                    .frame(width: 180, height: 100)
                    .cornerRadius(10)
                Text(text)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

struct songCategoryBox_Previews: PreviewProvider {
    static var previews: some View {
        songCategoryBox(text:"Hip Hop",color:.purple)
    }
}
