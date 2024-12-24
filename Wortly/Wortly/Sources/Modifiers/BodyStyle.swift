//
//  BodyStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 20.12.2024.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
