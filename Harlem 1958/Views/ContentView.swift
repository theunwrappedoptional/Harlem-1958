//
//  ContentView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    var body: some View {
        TabView {
            NavigationStack{
                ArtistListView()
            }
            .tabItem {
                Label("Artists", systemImage: "person.3.fill")
            }
            InstrumentListView()
            .tabItem {
                Label("Instruments", image: "custom.instrument")
            }
            JazzStyleView()
            .tabItem {
                Label("Jazz Styles", systemImage: "music.quarternote.3")
            }
                
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
