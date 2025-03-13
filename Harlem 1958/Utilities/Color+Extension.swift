//
//  Color+Extension.swift
//  Harlem 1958
//
//  Created by Manhattan on 21/02/25.
//

import Foundation
import SwiftUI

extension Color {
    /// Convert SwiftUI Color to a Hex String
    ///
    func toHex(withHash: Bool = false) -> String? {
        // Convert to UIColor
        let uiColor = UIColor(self)

        // Extract RGBA components
        guard let components = uiColor.cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Int(components[0] * 255)
        let g = Int(components[1] * 255)
        let b = Int(components[2] * 255)

        // Handle alpha (optional)
        let alpha = uiColor.cgColor.alpha
        let result = withHash ? "#" : ""
        
        if alpha < 1.0 {
            let a = Int(alpha * 255)
            return result + String(format: "%02X%02X%02X%02X", r, g, b, a)
        } else {
            return result + String(format: "%02X%02X%02X", r, g, b)
        }
    }
}

