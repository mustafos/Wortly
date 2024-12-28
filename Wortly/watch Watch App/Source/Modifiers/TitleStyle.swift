//
//  TitleStyle.swift
//  watch Watch App
//
//  Created by Mustafa Bekirov on 28.12.2024.
//

import SwiftUI

public struct TitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}
