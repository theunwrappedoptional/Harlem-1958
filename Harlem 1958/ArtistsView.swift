//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    var artists:[Artist]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(artists) { artist in
                    NavigationLink(value: artist) {
                        HStack{
                            Text("\(artist.name)  \(artist.surname)")
                            Spacer()
                            Text("\(artist.birth)")
                        }
                    }
                }
            }
            .navigationTitle("Harlem 1958")
        }
    }
}

#Preview {
    let artists: [Artist] = Bundle.main.decode("artists.json")
    return ArtistsView(artists: artists)
}
