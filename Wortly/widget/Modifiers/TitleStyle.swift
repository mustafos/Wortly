//
//  TitleStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 24.12.2024.
//

import SwiftUI

public struct TitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .frame(height: 15, alignment: .leading)
            .minimumScaleFactor(0.8)
            .fixedSize()
    }
    
    public init() {}
}
