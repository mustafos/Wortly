//
//  SubtitleStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 21.04.2025.
//

import SwiftUI

public struct SubTitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.secondary)
            .frame(height: 15, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
    
    public init() {}
}
