//
//  ContentView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            ArtistsView()
            .tabItem {
                Label("Artists", systemImage: "person.3.fill")
            }
            
            ArtistsView(groupedBy: .instrument, navTitle: "Instruments")
            .tabItem {
                Label("Instruments", image: "custom.instrument")
            }
            
            ArtistsView(groupedBy: .jazzStyle, navTitle: "Jazz Styles")
            .tabItem {
                Label("Jazz Styles", systemImage: "music.quarternote.3")
            }
        }
        .preferredColorScheme(.dark)
    }
}

enum GroupByOption: String, CaseIterable, Identifiable {
    case none = "All"
    case instrument = "Instrument"
    case jazzStyle = "Style"
    
    var id: String { rawValue }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
