//
//  Artists.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import Foundation

@Observable
class ModelData {
    
    var artists: [Artist] = Bundle.main.decode("artists.json")
    
    var allFiltered: [String: [Artist]] {
        instruments.merging(jazzStyles) { $1 }
    }
    
    var instruments: [String: [Artist]] {
        var instruments = [String:[Artist]]()
        
        for artist in artists {
            for instrument in artist.instruments {
                instruments[instrument, default:[]].append(artist)
            }
        }
        return instruments
    }
    
    var jazzStyles: [String: [Artist]] {
        var styles = [String:[Artist]]()
        
        for artist in artists {
            for style in artist.jazzStyle {
                styles[style, default: []].append(artist)
            }
        }
        return styles
    }
}
