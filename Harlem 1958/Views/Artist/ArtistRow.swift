//
//  ArtistRow.swift
//  Harlem 1958
//
//  Created by Manhattan on 14/02/25.
//

import SwiftUI

struct ArtistRow: View {
    
    let artist: Artist
    var isOrderedBySurname = false
    
    var body: some View {
        HStack {
            // TODO: Add URL for image
            AsyncImage(url: nil, scale: 1) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundStyle(.magentaMemoir)
            }

            VStack(alignment: .leading) {
                Text(isOrderedBySurname ? artist.fullSurname : artist.fullName)
                    .bold()
                
                Text("\(artist.birthString) - \(artist.deathString)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistRow(artist: artists[0])
            .preferredColorScheme(.dark)
}
