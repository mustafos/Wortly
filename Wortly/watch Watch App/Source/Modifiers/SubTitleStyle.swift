//
//  SubTitleStyle.swift
//  watch Watch App
//
//  Created by Mustafa Bekirov on 28.12.2024.
//

import SwiftUI

public struct SubTitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}
