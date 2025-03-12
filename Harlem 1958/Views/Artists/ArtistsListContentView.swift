//
//  ArtistsListContentView.swift
//  Harlem 1958
//
//  Created by Manhattan on 12/03/25.
//

import SwiftUI

struct ArtistsListContentView: View {
    
    let artists: [String:[Artist]]
    let selectedSortOption: ListSortOption
    let groupedBy: GroupByOption
    
    var body: some View {
        if groupedBy == .none {
            List {
                ForEach(artists["All"]!) { artist in
                    NavigationLink(value: artist) {
                        ArtistRowView(
                            artist: artist,
                            isOrderedBySurname: selectedSortOption == .surname
                        )
                    }
                }
            }
        } else {
            List{
                ForEach(Array(artists.keys).sorted(), id: \.self) { group in
                    Section(header:Text(group).font(.headline).foregroundStyle(Color.cheese)) {
                            ForEach(artists[group]!, id: \.self){ artist in
                                NavigationLink(value: artist) {
                                    ArtistRowView(
                                        artist: artist,
                                        isOrderedBySurname: selectedSortOption == .surname
                                    )
                                }
                            }
                        }
                    }
                }
        }
    }
}

//#Preview {
//    ArtistsListContentView(artists: <#[String : [Artist]]#>, selectedSortOption: <#ListSortOption#>, groupedBy: <#GroupByOption#>)
//}
