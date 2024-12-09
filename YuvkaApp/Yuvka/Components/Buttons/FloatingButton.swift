//
//  FloatingButton.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import SwiftUI

struct FloatingButton: View {
    let action: () -> Void
    let icon: String
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    action()
                }) {
                    Image(systemName: icon)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .frame(width: 60, height: 60)
                .background(.accent)
                .cornerRadius(30)
                .shadow(radius: 10)
                .offset(x: -25, y: -100)
            }
        }
    }
}

#Preview {
    FloatingButton(action: {print("Got pressed")}, icon: "plus")
}
