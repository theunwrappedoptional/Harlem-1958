//
//  Artists.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import Foundation
import SwiftUI

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
    
    func imageFor(_ instrument: String, color: Color) -> String  {
        let urlBase = "https://img.icons8.com/ios-filled/100/"
        let urlString = urlBase + color.toHex()!
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
}
