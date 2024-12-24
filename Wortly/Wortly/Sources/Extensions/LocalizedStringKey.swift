//
//  LocalizedStringKey.swift
//  wortly
//
//  Created by Mustafa Bekirov on 17.12.2024.
//

import SwiftUI

extension LocalizedStringKey {

    var stringKey: String {
        let description = "\(self)"
        let components = description.components(separatedBy: "key: \"").map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
    
    func stringValue() -> String {
        return NSLocalizedString(stringKey, comment: "")
    }
}
