//
//  ContentView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    
    let artists: [Artist] = Bundle.main.decode("artists.json")
    
    var body: some View {
        TabView {
            ArtistsView(artists: artists)
                .tabItem {
                    Label("Artists", systemImage: "person.3.fill")
                }
            Text("Instruments")
                .tabItem {
                    Label("Instruments", systemImage: "music.mic")
                    // TODO: Find a better icon for "Instruments"
                }
            Text("Jazz Styles")
                .tabItem {
                    Label("Jazz Styles", systemImage: "music.quarternote.3")
                    // TODO: Find a better icon for "Jazz Styles"
                }
        }
    }
}

#Preview {
    ContentView()
}
