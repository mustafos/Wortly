//
//  ImageExt.swift
//  wortly
//
//  Created by Mustafa Bekirov on 17.12.2024.
//

import SwiftUI

extension Image {
    
    func thumbnailImageModifier(tintColor: Color) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 17.0, height: 17.0)
            .padding(6.0)
            .background(tintColor)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))
   }
}
