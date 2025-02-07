//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    let list: [Artist]
   
    var instrumentFilter: String = ""
    var jazzStyleFilter: String = ""
    
    var navTitle = "Harlem 1958"
    
    var sortedList: [Artist] {
        if !instrumentFilter.isEmpty {
            return list.filter { artist in
                artist.instruments.contains(instrumentFilter)
            }.sorted(by: sortKey)
        } else if !jazzStyleFilter.isEmpty {
            return list.filter { artist in
                artist.jazzStyle.contains(jazzStyleFilter)
            }.sorted(by: sortKey)
        } else {
            return list.sorted(by: sortKey)
        }
    }
    
    @State private var selectedSortOption: SortOption = .name
    
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
    
    var body: some View {
        List {
            ForEach(sortedList) { artist in
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
        .navigationDestination(for: Artist.self) { artist in
            ArtistView(artist: artist)
        }
        .navigationTitle(navTitle)
        .navigationBarTitleDisplayMode(instrumentFilter.isEmpty && jazzStyleFilter.isEmpty ? .large : .inline )
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

#Preview {    
    let artists = Artists()
    return NavigationStack{
        ArtistsView(list: artists.list)
    }
}
