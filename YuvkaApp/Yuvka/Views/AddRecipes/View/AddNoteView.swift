//
//  AddNoteView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 29.11.2024.
//

import SwiftUI

struct AddNoteView: View {
    
    @Binding var text: String
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Your Note")
                    .font(.custom("Poppins-SemiBold", size: 25))
                    .foregroundStyle(Color.accentColor)
                Spacer()
                Button(action: {
                    dismissSheet()
                }, label: {
                    Text("Done")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundStyle(.white)
                })
            }
            .padding()
            
            ScrollView {
                VStack {
                    TextField("this is my favorite", text: $text, axis: .vertical)
                }
                .padding(10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .background(.crispyCrust)
            .padding()
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        hideKeyboard()
                    }
            )
            .clipShape(RoundedRectangle(cornerRadius: 17))
        }
    }
}
