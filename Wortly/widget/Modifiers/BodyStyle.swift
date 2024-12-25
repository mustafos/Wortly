//
//  BodyStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 25.12.2024.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
    
    public init() {}
}
