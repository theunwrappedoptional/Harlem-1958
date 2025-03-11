//
//  InstrumentListView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentListView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    @State private var searchName = ""
    
    var allInstruments: [String] {
        return Array(modelData.instruments.keys).sorted()
    }
    
    func filteredList(for instrument: String) -> [Artist] {
        if searchName.isEmpty{
            return modelData.instruments[instrument]!.sorted(by: { $0.name < $1.name } )
        } else {
            return modelData.instruments[instrument]!.filter { $0.fullName.localizedCaseInsensitiveContains(searchName)
            }.sorted(by: { $0.name < $1.name })
        }
    }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(allInstruments, id: \.self) { instrument in
                    Section(header: Text(instrument).font(.headline).foregroundStyle(Color.cheese)) {
                        ForEach(filteredList(for: instrument), id: \.self){ artist in
                                NavigationLink(value: artist) {
                                    ArtistRowView(artist: artist)
                                }
                            }
                        }
                    }
                }
            .searchable(text: $searchName)
            .navigationTitle("Instruments")
            .navigationDestination(for: Artist.self) { artist in
                ArtistView(artist: artist)
            }
        }
    }
}

#Preview {
    return InstrumentListView()
            .preferredColorScheme(.dark)
            .environment(ModelData())
}
