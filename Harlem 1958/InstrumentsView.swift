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
                                //FIXME: Add Image
                                Color.magentaMemoir
                                    .frame(maxWidth: CGFloat.infinity, minHeight: 150)
                                
                                VStack{
                                    Text(instrument)
                                        .font(Font.headline)
                                        .foregroundStyle(Color.white)
                                    
                                    Text("(\(modelData.instruments[instrument]!.count))")
                                        .foregroundStyle(Color.white)
                                }
                            }
                            .clipShape(.rect(cornerRadius:10))
                        }
                    }
                }
                .padding([Edge.Set.horizontal, Edge.Set.bottom])
            }
            .navigationTitle("Instruments")
            .navigationDestination(for: String.self) { instrument in
                Text(instrument)
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
