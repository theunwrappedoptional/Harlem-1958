//
//  JazzStyleView.swift
//  Harlem 1958
//
//  Created by Manhattan on 07/02/25.
//

import SwiftUI

struct JazzStyleView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    @State private var searchName = ""
    
    func filteredList(for style: String) -> [Artist] {
        if searchName.isEmpty{
            return modelData.jazzStyles[style]!.sorted(by: { $0.name < $1.name } )
        } else {
            return modelData.jazzStyles[style]!.filter { $0.fullName.localizedCaseInsensitiveContains(searchName)
            }.sorted(by: { $0.name < $1.name })
        }
    }

    var allStyles: [String] {
        return Array(modelData.jazzStyles.keys).sorted()
    }
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(allStyles, id: \.self) { style in
                    Section(header: Text(style).font(.headline).foregroundStyle(Color.cheese)) {
                        ForEach(filteredList(for: style), id: \.self){ artist in
                                NavigationLink(value: artist) {
                                    ArtistRowView(artist: artist)
                                }
                            }
                        }
                    }
                }
            .searchable(text: $searchName)
            .navigationTitle("Jazz Styles")
            .navigationDestination(for: Artist.self) { artist in
                ArtistView(artist: artist)
            }
        }
    }
}

#Preview {
    return JazzStyleView()
            .environment(ModelData())
            .preferredColorScheme(.dark)
}
