//
//  SubtitleStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 20.04.2025.
//

import SwiftUI

struct SubTitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}
