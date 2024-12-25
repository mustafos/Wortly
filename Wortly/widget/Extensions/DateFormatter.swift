//
//  DateFormatter.swift
//  wortly
//
//  Created by Mustafa Bekirov on 25.12.2024.
//

import Foundation

extension DateFormatter {
    
    static var defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
}
