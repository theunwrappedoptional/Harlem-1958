//
//  Artists.swift
//  Harlem 1958
//
//  Created by Manhattan on 06/02/25.
//

import Foundation

@Observable
class Artists {
    
    var list: [Artist] = Bundle.main.decode("artists.json")
    var selectedSortOption: SortOption = .name
    
    var sortedList: [Artist] {
        return list.sorted(by: sortKey)
    }
    
    enum SortOption: String, CaseIterable, Identifiable {
        case name = "Name"
        case surname = "Surname"
        case birth = "Birth"

        var id: String { rawValue }
    }
    
    private var sortKey: (Artist, Artist) -> Bool {
        switch selectedSortOption {
            case .name:
                return { $0.name < $1.name }
            case .surname:
                return { $0.surname < $1.surname }
            case .birth:
                return { $0.birthDate < $1.birthDate }
        }
    }
    
    var instruments: [String: Int] {
        getInstruments()
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
}
