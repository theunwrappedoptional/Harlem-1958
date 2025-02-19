//
//  InstrumentsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentsView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var filteredList: [String] {
        return Array(modelData.instruments.keys).sorted()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(filteredList, id: \.self) { instrument in
                        NavigationLink(value: instrument) {
                            ZStack{
                                AsyncImage(url: URL(string: modelData.instruments[instrument]![0].pic)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .overlay(Color.maniacMansion.opacity(0.7))
                                } placeholder: {
                                    Color.maniacMansion
                                        .frame(maxWidth: CGFloat.infinity, minHeight: 120)
                                }
                                
                                VStack{
                                    Text(instrument)
                                        .textCase(.uppercase)
                                        .font(Font.headline)
                                        .fontWeight(.bold)
                                    
                                    Text("(\(modelData.instruments[instrument]!.count))")
                                        .font(Font.caption)
                                        .foregroundStyle(Color.white)
                                }
                                .padding(8)
                            }
                            .frame(height: 150)
                            .clipShape(.rect(cornerRadius:8))
                        }
                    }
                }
                .padding([Edge.Set.horizontal, Edge.Set.bottom])
            }
            .navigationTitle("Instruments")
            .navigationDestination(for: String.self) { instrument in
                ArtistsView(filter: instrument)
            }
        }
    }
}

#Preview {
    return NavigationStack{
        InstrumentsView()
            .environment(ModelData())
            .preferredColorScheme(.dark)
    }
}
