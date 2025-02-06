//
//  InstrumentsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentsView: View {
    
    @Environment(Artists.self) var artists
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(Array(artists.instruments), id: \.key) { key, value in
                    NavigationLink(value: key) {
                        HStack{
                            Text("\(key)")
                            Spacer()
                            Text("(\(value))")
                        }
                    }
                }
            }
            .navigationTitle("Instruments")
        }
    }
}

#Preview {
    InstrumentsView()
        .environment(Artists())
}
