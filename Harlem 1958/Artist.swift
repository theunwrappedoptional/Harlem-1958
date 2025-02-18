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
    let pic: String
    let dates: String
    let instruments: [String]
    let about: String
    let jazzStyle: [String]
    let albumPicks: [String]
    
    var fullName: String {
        name + " " + surname
    }
    
    var fullSurname: String {
        surname + " " + name
    }
    
    var birthDate: Date {
        let birthString = dates.split(separator: "-").map{String($0)}[0]
        let birthStringFormatted = formatDateString(from: birthString)
        return dateFromString(birthStringFormatted)!
    }
    
    var deathDate: Date? {
        guard dates.last != "-" else {
            return nil
        }
        let deathString = dates.split(separator: "-").map{String($0)}[1]
        let deathStringFormatted = formatDateString(from: deathString)
        return dateFromString(deathStringFormatted)
    }
    
    var birthString: String {
        return birthDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var deathString: String {
        return deathDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    private func dateFromString(_ s: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.locale = .current
        return dateFormatter.date(from: s)
    }
    
    private func formatDateString(from dateString: String) -> String {
        var components = dateString.split(separator: "/").map{String($0)}
        
        if components.count == 3 {
            for (index, item) in components.enumerated() {
                if index != 2 {
                    if item.count == 1 {
                        components[index] = "0" + item
                    }
                } else {
                    if item.count == 2 {
                        components[index] = "19" + item
                    }
                }
            }
        }
        return components.joined(separator: "/")
    }
    
}
