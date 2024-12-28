//
//  BodyStyle.swift
//  watch Watch App
//
//  Created by Mustafa Bekirov on 28.12.2024.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .minimumScaleFactor(0.1)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}
