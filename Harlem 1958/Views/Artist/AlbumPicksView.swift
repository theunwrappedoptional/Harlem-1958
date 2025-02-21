//
//  AlbumPicksView.swift
//  Harlem 1958
//
//  Created by Manhattan on 19/02/25.
//

import SwiftUI

struct AlbumPicksView: View {
    
    var albums: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Album Picks")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(albums, id: \.self) { album in
                        ZStack(){
                            //FIXME: The image definition seems too low
                            AsyncImage(url: URL(string: "https://img.icons8.com/ios-filled/100/music-record.png")) { image in
                                image
                                    .resizable()
                                    .opacity(0.2)
                            } placeholder: {
                                Color.black.opacity(0)
                            }
                            .frame(width: .infinity, height: .infinity,alignment: .center)

                            Text(album)
                                .multilineTextAlignment(.center)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.cheese)
                                .padding(5)
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.magentaMemoir)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return AlbumPicksView(albums:artists[0].albumPicks)
            .preferredColorScheme(.dark)
}
