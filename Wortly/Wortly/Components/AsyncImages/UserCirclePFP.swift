//
//  UserCirclePFP.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import SwiftUI
import Kingfisher

struct UserCirclePFP: View {
    let imageUrl: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: imageUrl))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFill()
        }
    }
}
