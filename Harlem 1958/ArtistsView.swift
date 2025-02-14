//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ArtistsView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    @State private var searchName = ""
    @State private var selectedSortOption: SortOption = .name
    
    var filteredList: [Artist] {
        if searchName.isEmpty {
            return modelData.artists.sorted(by: sortKey)
        } else {
            return modelData.artists.filter { $0.fullName.localizedCaseInsensitiveContains(searchName)
            }.sorted(by: sortKey)
        }
    }
    
    enum SortOption: String, CaseIterable, Identifiable {
        case name = "Name"
        case surname = "Surname"
        case birth = "Birth"

        var id: String { rawValue }
    }
    
    var sortKey: (Artist, Artist) -> Bool {
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
        ZStack {
            List {
                ForEach(filteredList) { artist in
                    NavigationLink(value: artist) {
                        ArtistRow(artist: artist, isOrderedBySurname: selectedSortOption == .surname ? true : false)
                    }
                    .listRowBackground(Color.maniacMansion)
                }
            }
        }
        .navigationDestination(for: Artist.self) { artist in
            ArtistView(artist: artist)
        }
        .navigationTitle("Harlem 1958")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar{
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $selectedSortOption) {
                    ForEach(SortOption.allCases) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
            }
        }
        
        //FIXME: Glitch (on preview and simulator)
        .searchable(text: $searchName, placement: .automatic, prompt: "Search Artist")
    }
}

#Preview {
    return NavigationStack{
        ArtistsView()
            .environment(ModelData())
            .preferredColorScheme(.dark)
    }
}
