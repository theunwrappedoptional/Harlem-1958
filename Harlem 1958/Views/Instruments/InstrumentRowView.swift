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
    
    let urlBase = "https://img.icons8.com/ios-filled/100/"
    let iconColorHexCode = "ff6361"
    
    func imageFor(_ instrument: String) -> String  {
        let urlString = urlBase+iconColorHexCode
        switch instrument {
            case "Bass":
                return urlString + "/bass-clef.png"
            case "Clarinet":
                return urlString + "/clarinet.png"
            case "Drums":
                return urlString + "/drum-set.png"
            case "Piano":
                return urlString + "/grand-piano.png"
            case "Saxophone":
                return urlString + "/saxophone.png"
            case "Trombone":
                return urlString + "/trombone.png"
            case "Trumpet":
                return urlString + "/trumpet.png"
            case "Violin":
                return urlString + "/violin.png"
            default:
                return urlString + "/micro.png"
        }
    }
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: imageFor(instrument))) { image in
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
