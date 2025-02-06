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
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .opacity(0.5)
                    .padding([.leading, .trailing,.top], 50)
                    .padding(.bottom, 30)
                
                Text("🎂 \(artist.birthString)")
                Text("🪦 \(artist.deathString)")
                    .padding(2)
                
                Text("\(artist.instruments.joined(separator: ",")) ")
                    .padding()
                
                Text(artist.about)
                    .padding()
                
                Text("\(artist.albumPicks.joined(separator: "\n")) ")
                    .padding()
            }
            
        }
        .navigationTitle(artist.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistView(artist: artists[0])
}
