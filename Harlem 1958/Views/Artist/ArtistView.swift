//
//  ArtistView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct ArtistView: View {
    
    let artist: Artist
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack(alignment: .leading){
                    ArtistImageView(artist: artist)
                        .frame(width: geometry.size.width, height: 600)
                    
                    Group {
                        Text("About")
                            .font(.headline)
                            .fontWeight(.bold)
                        .padding(.vertical, 20)
                        Text(artist.about)
                            .padding(.bottom, 20)
                          
                        if !artist.albumPicks.isEmpty {
                            AlbumPicksView(albums: artist.albumPicks)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle(artist.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistView(artist: artists[0])
            .preferredColorScheme(.dark)
}
