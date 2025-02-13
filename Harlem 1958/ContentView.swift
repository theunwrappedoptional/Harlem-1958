//
//  ContentView.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var artists = Artists()
    
    var body: some View {
        TabView {
            NavigationStack{
                ArtistsView(list: artists.list, navTitle: "Harlem 1958")
            }
            .tabItem {
                Label("Artists", systemImage: "person.3.fill")
            }
            InstrumentsView(list:artists.list, instruments: artists.instruments)
            .tabItem {
                Label("Instruments", image: "custom.instrument")
            }
            JazzStyleView(list:artists.list, jazzStyle: artists.jazzStyles)
            .tabItem {
                Label("Jazz Styles", systemImage: "music.quarternote.3")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
