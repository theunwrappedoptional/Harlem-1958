//
//  Artist.swift
//  Harlem 1958
//
//  Created by Manhattan on 31/01/25.
//

import Foundation

struct Artist: Codable, Identifiable, Hashable {
    
    var id: String { name + surname }
    let name: String
    let surname: String
    let dates: String
    let instruments: [String]
    let about: String
    let jazzStyle: [String]
    let albumPicks: [String]
    
    var fullName: String {
        name + " " + surname
    }
    
    var birth: String {
        return dates.split(separator: "-").map{String($0)}[0]
    }
    
    var death: String {
        return dates.split(separator: "-").map{String($0)}[1]
    }
    
}
