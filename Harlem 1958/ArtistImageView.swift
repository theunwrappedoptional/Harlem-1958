//
//  ArtistImageView.swift
//  Harlem 1958
//
//  Created by Manhattan on 18/02/25.
//

import SwiftUI

//FIXME: Image Credits???

struct ArtistImageView: View {
    
    let artist: Artist
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: artist.pic), scale: 1) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
            }
            .overlay(Color.black.opacity(0.3))
            
            VStack {
                Spacer()
                Text("\(artist.birthString) - \(artist.deathString)")
                    .padding(8)
                    .background(Color.twilight.opacity(0.8))
                    .clipShape(Capsule())
                
                HStack{
                    Text("\(Image("custom.instrument")) \(artist.instruments.joined(separator: ",")) ")
                    
                    Text("\(Image(systemName: "music.quarternote.3")) \(artist.jazzStyle.joined(separator: ", ")) ")
                        .multilineTextAlignment(.center)
                }
                .padding(8)
                .background(Color.magentaMemoir.opacity(0.8))
                .clipShape(Capsule())
            }
            .padding()
        }
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistImageView(artist: artists[0])
            .preferredColorScheme(.dark)
            .frame(width: 300, height: 600)
}
