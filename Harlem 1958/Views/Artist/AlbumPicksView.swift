//
//  AlbumPicksView.swift
//  Harlem 1958
//
//  Created by Manhattan on 19/02/25.
//

import SwiftUI

struct AlbumPicksView: View {
    
    var albums: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Album Picks")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(albums, id: \.self) { album in
                        ZStack(){
                            
                            Image("music-record")
                                .resizable()
                                .frame(width: 150, height: 150,alignment: .center)
                                .opacity(0.5)

                            Text(album)
                                .multilineTextAlignment(.center)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.cheese)
                                .padding(5)
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.magentaMemoir)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return AlbumPicksView(albums:artists[0].albumPicks)
            .preferredColorScheme(.dark)
}
