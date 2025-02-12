//
//  InstrumentsView.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import SwiftUI

struct InstrumentsView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var list: [Artist]
    var instruments:[String: Int]
    
    var filteredList: [String] {
            return Array(instruments.keys).sorted()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(filteredList, id: \.self) { key in
                        NavigationLink(value: key) {
                            ZStack{
                                //FIXME: Add Image
                                Color.magentaMemoir
                                    .frame(maxWidth: CGFloat.infinity, minHeight: 150)
                                
                                VStack{
                                    Text(key)
                                        .font(Font.headline)
                                        .foregroundStyle(Color.white)
                                    
                                    Text("(\(instruments[key]!))")
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
                ArtistsView(
                    list: list.filter{$0.instruments.contains(instrument)},
                    navTitle: "\(instrument) Players")
            }
        }
    }
}

#Preview {
    let artists = Artists()
    return NavigationStack{
        InstrumentsView(list: artists.list, instruments: artists.instruments)
            .preferredColorScheme(.dark)
    }
}
