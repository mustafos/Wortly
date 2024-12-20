//
//  TitleStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 20.12.2024.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
    }
}
