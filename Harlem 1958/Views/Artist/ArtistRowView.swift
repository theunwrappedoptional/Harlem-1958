//
//  ArtistRowView.swift
//  Harlem 1958
//
//  Created by Manhattan on 14/02/25.
//

import SwiftUI

struct ArtistRowView: View {
    @Environment(ModelData.self) var modelData: ModelData

    let artist: Artist
    var isOrderedBySurname = false
    var imageURL: URL? {
        URL(string:modelData.imageFor(artist.instruments[0], color: .magentaMemoir))
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: imageURL, scale: 1) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundStyle(.magentaMemoir)
            }
            .clipShape(Circle())
            .frame(width: 40, height: 40)
            .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(isOrderedBySurname ? artist.fullSurname : artist.fullName)
                    .bold()
                
                Text("\(artist.birthString) - \(artist.deathString)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistRowView(artist: artists[0])
            .environment(ModelData())
            .preferredColorScheme(.dark)
}
