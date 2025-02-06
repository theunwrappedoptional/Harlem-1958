//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    var artists:[Artist]
    
    //TODO: Check deathDate = nil case in comparison
    
    enum SortOption: String, CaseIterable, Identifiable {
        case name = "Name"
        case surname = "Surname"
        case birth = "Birth"

        var id: String { rawValue }
    }
    
    private var sortKey: (Artist, Artist) -> Bool {
        switch selectedSortOption {
            case .name:
                return { $0.name < $1.name }
            case .surname:
                return { $0.surname < $1.surname }
            case .birth:
                return { $0.birthDate < $1.birthDate }
        }
    }
    
    @State private var selectedSortOption: SortOption = .name
    
    var sortedArtists: [Artist] {
        return artists.sorted(by: sortKey)
    }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(sortedArtists) { artist in
                    NavigationLink(value: artist) {
                        HStack{
                            if selectedSortOption == .surname {
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
                    Picker("Sort", selection: $selectedSortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
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
