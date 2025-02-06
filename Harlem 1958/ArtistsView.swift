//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    @Environment(Artists.self) var artists
    
    var body: some View {
        
        @Bindable var artists = artists
        
        NavigationStack{
            List {
                ForEach(artists.sortedList) { artist in
                    NavigationLink(value: artist) {
                        HStack{
                            if artists.selectedSortOption == .surname {
                                Text(artist.fullSurname)
                            } else {
                                Text(artist.fullName)
                            }
                            Spacer()
                            Text(artist.birthString)
                        }
                    }
                }
            }
//            .listStyle(.plain)
            .navigationDestination(for: Artist.self) { artist in
                ArtistView(artist: artist)
            }
            .navigationTitle("Harlem 1958")
            .toolbar{
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $artists.selectedSortOption) {
                        ForEach(Artists.SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                }
            }

        }
    }
}

#Preview {
    ArtistsView()
        .environment(Artists())
}
