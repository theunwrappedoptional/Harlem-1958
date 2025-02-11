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
            ForEach(Array(jazzStyle.keys).sorted(), id: \.self) { key in
                NavigationLink(value: key) {
                    HStack{
                        Text(key)
                        Spacer()
                        Text("\(jazzStyle[key]!)")
                    }
                }
            }
        }
        .navigationDestination(for: String.self) { style in
            ArtistsView(list: list.filter{ $0.jazzStyle.contains(style)},
            navTitle: "\(style) Players")
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

// TODO: Create GridView (with images)
