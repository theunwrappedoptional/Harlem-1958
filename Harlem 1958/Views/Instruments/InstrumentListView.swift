//
//  InstrumentListView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentListView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    var filteredList: [String] {
        return Array(modelData.instruments.keys).sorted()
    }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(filteredList, id: \.self) { instrument in
                    NavigationLink(value: instrument) {
                        InstrumentRowView(instrument: instrument)
                    }
                    .listRowBackground(Color.maniacMansion)
                }
            }
            .navigationTitle("Instruments")
            .navigationDestination(for: String.self) { instrument in
                ArtistListView(filter: instrument)
            }
        }
    }
}

#Preview {
    return InstrumentListView()
            .preferredColorScheme(.dark)
            .environment(ModelData())
}
