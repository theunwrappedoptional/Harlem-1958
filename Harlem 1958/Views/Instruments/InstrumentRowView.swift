//
//  InstrumentRowView.swift
//  Harlem 1958
//
//  Created by Manhattan on 20/02/25.
//

import SwiftUI

struct InstrumentRowView: View {
    
    @Environment(ModelData.self) var modelData: ModelData
    
    var instrument: String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: modelData.imageFor(instrument, color: .fusionRed))) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "music.note.list")
                    .resizable()
                    .foregroundColor(.fusionRed)
            }
            .frame(width: 40, height: 40)
            .padding(.trailing, 5)
            
            VStack(alignment:.leading){
                Text(instrument)
                    .bold()
                
                Text("(\(modelData.instruments[instrument]!.count))")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return InstrumentRowView(instrument: artists[0].instruments[0])
            .preferredColorScheme(.dark)
            .environment(ModelData())
}
