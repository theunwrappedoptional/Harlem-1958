//
//  InstrumentsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentsView: View {
    
    var list: [Artist]
    var instruments:[String: Int]
    
    var body: some View {
        List {
            ForEach(Array(instruments), id: \.key) { key, value in
                NavigationLink(value: key) {
                    HStack{
                        Text(key)
                        Spacer()
                        Text("\(value)")
                    }
                }
            }
        }
        .navigationTitle("Instruments")
        .navigationDestination(for: String.self) { instrument in
                ArtistsView(list: list, instrumentFilter: instrument, navTitle: "\(instrument) Players")
        }
    }
}

#Preview {
    let artists = Artists()
    return NavigationStack{
        InstrumentsView(list: artists.list, instruments: artists.instruments)
    }
}
