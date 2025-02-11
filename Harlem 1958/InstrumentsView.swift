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
            ForEach(Array(instruments.keys).sorted(), id: \.self) { key in
                NavigationLink(value: key) {
                    HStack{
                        Text(key)
                        Spacer()
                        Text("\(instruments[key]!)")
                    }
                }
            }
        }
        .navigationTitle("Instruments")
        .navigationDestination(for: String.self) { instrument in
            ArtistsView(
                list: list.filter{$0.instruments.contains(instrument)},
                navTitle: "\(instrument) Players")
        }
    }
}

#Preview {
    let artists = Artists()
    return NavigationStack{
        InstrumentsView(list: artists.list, instruments: artists.instruments)
    }
}

// TODO: Create GridView (with images)
