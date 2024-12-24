//
//  FooterStyle.swift
//  wortly
//
//  Created by Mustafa Bekirov on 20.12.2024.
//

import SwiftUI

struct FooterStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.secondary)
            .font(.footnote)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowInsets(EdgeInsets(top: 20.0, leading: 0.0, bottom: 20.0, trailing: 0.0))
    }
}
