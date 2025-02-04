//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    var artists:[Artist]
    
    //TODO: Add birth date sort
    //TODO: Add name + surname option
    
    @State private var sortKey:KeyPath<Artist, String> = \Artist.name
    
    var sortedArtists: [Artist] {
        return artists.sorted { $0[keyPath: sortKey] < $1[keyPath: sortKey]}
    }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(sortedArtists) { artist in
                    NavigationLink(value: artist) {
                        HStack{
                            Text("\(artist.name)  \(artist.surname)")
                            Spacer()
                            Text("\(artist.birth)")
                        }
                    }
                }
            }
//            .listStyle(.plain)
            .navigationTitle("Harlem 1958")
            .toolbar{
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortKey) {
                        
                        Text("Name")
                            .tag(\Artist.name)
                        
                        Text("Surname")
                            .tag(\Artist.surname)

                    }
                }
            }

        }
    }
}

#Preview {
    let artists: [Artist] = Bundle.main.decode("artists.json")
    return ArtistsView(artists: artists)
}
