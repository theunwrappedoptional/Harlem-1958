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
                VStack{
                    ArtistImageView(artist: artist)
                        .frame(width: geometry.size.width, height: 600)
                    
                    
                    Text(artist.about)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                    
                    Text("\(artist.albumPicks.joined(separator: "\n")) ")
                        .multilineTextAlignment(.center)
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


// TODO: Find a smart way to fetch images
// TODO: Layout ArtistView
