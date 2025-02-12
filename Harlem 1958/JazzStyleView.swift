//
//  JazzStyleView.swift
//  Harlem 1958
//
//  Created by Manhattan on 07/02/25.
//

import SwiftUI

struct JazzStyleView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var list: [Artist]
    var jazzStyle:[String: Int]
    
    var filteredList: [String] {
            return Array(jazzStyle.keys).sorted()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(filteredList, id: \.self) { key in
                        NavigationLink(value: key) {
                            ZStack{
                                //FIXME: Add image
                                Color.magentaMemoir
                                    .frame(maxWidth: CGFloat.infinity, minHeight: 150)
                                
                                VStack{
                                    Text(key)
                                        .font(Font.headline)
                                        .foregroundStyle(Color.white)
                                    
                                    Text("(\(jazzStyle[key]!))")
                                        .foregroundStyle(Color.white)
                                }
                            }
                            .clipShape(.rect(cornerRadius:10))
                        }
                    }
                }
                .padding([Edge.Set.horizontal, Edge.Set.bottom])
            }
            .navigationDestination(for: String.self) { style in
                ArtistsView(list: list.filter{ $0.jazzStyle.contains(style)},
                            navTitle: "\(style) Players")
            }
            .navigationTitle("Jazz Styles")
        }
    }
}

#Preview {
    let artists = Artists()
    return NavigationStack{
        JazzStyleView(list: artists.list, jazzStyle: artists.jazzStyles)
            .preferredColorScheme(.dark)
    }
}
