//
//  ArtistsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

enum ListSortOption: String, CaseIterable, Identifiable {
    case name = "Name"
    case surname = "Surname"
    case birth = "Birth"

    var id: String { rawValue }
}

private struct SortMenu: View {
    @Binding var selectedOption: ListSortOption
    
    var body: some View {
        Menu {
            Picker("Sort", selection: $selectedOption) {
                ForEach(ListSortOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            }
        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}

struct ArtistsView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    @State private var networkMonitor = NetworkMonitor()

//    @State private var showConnectionAlert = false

    @State private var searchQuery = ""
    @State private var selectedSortOption: ListSortOption = .name
    var groupedBy: GroupByOption = .none
    var navTitle = "Harlem 1958"

    var list: [String:[Artist]] {
        switch groupedBy {
        case .none:
            let artists = modelData.artists
            
            let filteredList = searchQuery.isEmpty ? artists : artists.filter { $0.fullName.localizedCaseInsensitiveContains(searchQuery) }
            
            let sorted = filteredList.sorted { first, second in
                switch selectedSortOption {
                case .name:
                    return first.name < second.name
                case .surname:
                    return first.surname < second.surname
                case .birth:
                    return first.birthDate < second.birthDate
                }
            }
            
            return ["All": sorted]
            
        default:
            let groups = groupedBy.rawValue == "Instrument" ? modelData.instruments : modelData.jazzStyles
            
            var sortedAndFiltered = groups
            
            for item in groups.keys {
                if !searchQuery.isEmpty {
                    sortedAndFiltered[item] = groups[item]!.filter { $0.fullName.localizedCaseInsensitiveContains(searchQuery)
                    }
                }
                
                sortedAndFiltered[item]!.sort { first, second in
                    switch selectedSortOption {
                    case .name:
                        return first.name < second.name
                    case .surname:
                        return first.surname < second.surname
                    case .birth:
                        return first.birthDate < second.birthDate
                    }
                }
            }
            
            return sortedAndFiltered
        }
    }
    
    var body: some View {
        NavigationStack{
            ArtistsListContentView(
                artists: list,
                selectedSortOption: selectedSortOption,
                groupedBy: groupedBy
            )
            .searchable(text: $searchQuery)
            .navigationDestination(for: Artist.self) { artist in
                ArtistView(artist: artist)
            }
            .navigationTitle(navTitle)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    SortMenu(selectedOption: $selectedSortOption)
                }
            }
        }
        .alert(isPresented: $networkMonitor.showAlert) {
            Alert(
                title: Text("It looks like you're not connected to the internet"),
                message: Text("Without internet connection you won't be able to access all the app contents. Please check your connection and try again."),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear{
            print(list["All"]!.count)
        }
    }
}

#Preview {
    return NavigationStack{
        ArtistsView()
            .environment(ModelData())
            .preferredColorScheme(.dark)
    }
}
