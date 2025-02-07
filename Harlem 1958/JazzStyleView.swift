//
//  JazzStyleView.swift
//  Harlem 1958
//
//  Created by Manhattan on 07/02/25.
//

import SwiftUI

struct JazzStyleView: View {
    
    var list: [Artist]
    var jazzStyle:[String: Int]
    
    var body: some View {

        List {
            ForEach(Array(jazzStyle), id: \.key) { key, value in
                NavigationLink(value: key) {
                    HStack{
                        Text(key)
                        Spacer()
                        Text("\(value)")
                    }
                }
            }
        }
        .navigationDestination(for: String.self) { style in
            ArtistsView(list: list, jazzStyleFilter: style, navTitle: "\(style) Players")
        }
        .navigationTitle("Jazz Styles")
    }
}

#Preview {
    let artists = Artists()
    return NavigationStack{
        JazzStyleView(list: artists.list, jazzStyle: artists.jazzStyles)
    }
}
