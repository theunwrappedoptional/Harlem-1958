//
//  JazzStyleView.swift
//  Harlem 1958
//
//  Created by Manhattan on 07/02/25.
//

import SwiftUI

struct JazzStyleView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var filteredList: [String] {
        return Array(modelData.jazzStyles.keys).sorted()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(filteredList, id: \.self) { style in
                        NavigationLink(value: style) {
                            ZStack{
                                //FIXME: Add image
                                Color.magentaMemoir
                                    .frame(maxWidth: CGFloat.infinity, minHeight: 150)
                                
                                VStack{
                                    Text(style)
                                        .font(Font.headline)
                                        .foregroundStyle(Color.white)
                                    
                                    Text("(\(modelData.jazzStyles[style]!.count))")
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
                ArtistsView(filter: style)
            }
            .navigationTitle("Jazz Styles")
        }
    }
}

#Preview {
    return NavigationStack{
        JazzStyleView()
            .environment(ModelData())
            .preferredColorScheme(.dark)
    }
}
