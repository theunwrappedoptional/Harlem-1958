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
        ScrollView{
            VStack{
                AsyncImage(url: nil, scale: 1) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                } placeholder: {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .padding([.leading, .trailing,.top], 50)
                        .padding(.bottom, 30)
                }                
                
                Text("\(artist.birthString)")
                Text("\(artist.deathString)")
                    .padding(2)
                
                Text("\(artist.instruments.joined(separator: ",")) ")
                    .padding()
                
                Text("\(artist.jazzStyle.joined(separator: "\n")) ")
                    .multilineTextAlignment(.center)
                
                Text(artist.about)
                    .padding()
                
                Text("\(artist.albumPicks.joined(separator: "\n")) ")
                    .multilineTextAlignment(.center)
            }
            
        }
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
