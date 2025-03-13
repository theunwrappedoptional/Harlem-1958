//
//  ArtistImageView.swift
//  Harlem 1958
//
//  Created by Manhattan on 18/02/25.
//

import SwiftUI

//FIXME: Image Credits???
//TODO: Image Caching https://www.youtube.com/watch?v=CQDiQF-1_rY

struct ArtistImageView: View {
    
    let artist: Artist
    @State private var isImageLoaded = false
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: artist.pic), scale: 1) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .opacity(isImageLoaded ? 1 : 0) // Fade-in effect
                            .blur(radius: isImageLoaded ? 0 : 10) // Blur at first
                            .scaleEffect(isImageLoaded ? 1 : 1.1) // Scale effect
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.9)) {
                                    isImageLoaded = true // Animate when image loads
                                }
                            }
                    case .failure:
                        Image("placeholder") // Placeholder on failure
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
            }
 
            VStack(alignment: .center){
                Spacer()
                Text("\(artist.birthString) - \(artist.deathString)")
                    .padding(8)
                    .background(Color.twilight.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                HStack{
                    Text("\(Image("custom.instrument")) \(artist.instruments.joined(separator: ",")) ")
                    Text("\(Image(systemName: "music.quarternote.3")) \(artist.jazzStyle.joined(separator: ", ")) ")
                }
                .padding(8)
                .background(Color.magentaMemoir.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .font(.caption)
            .padding()
        }
    }
}

#Preview {
    let artists:[Artist] = Bundle.main.decode("artists.json")
    return ArtistImageView(artist: artists[0])
            .preferredColorScheme(.dark)
            .frame(width: 300, height: 600)
}
