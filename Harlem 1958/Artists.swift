//
//  Artists.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import Foundation

struct Artists {
    
    var list: [Artist] = Bundle.main.decode("artists.json")
    
    var instruments: [String: Int] {
        getInstruments()
    }
    
    var jazzStyles: [String: Int] {
        getJazzStyles()
    }
    
    private func getInstruments() -> [String: Int] {
        var instruments = [String:Int]()
        
        for artist in list {
            for instrument in artist.instruments {
                instruments[instrument, default: 0] += 1
            }
        }
        return instruments
    }
    
    private func getJazzStyles()  -> [String: Int] {
        var styles = [String:Int]()
        
        for artist in list {
            for style in artist.jazzStyle {
                styles[style, default: 0] += 1
            }
        }
        return styles
    }
}
