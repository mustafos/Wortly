//
//  AddRecipeView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 29.11.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @State var isPresenting: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack(alignment: .center,spacing: 20) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Add a Recipe")
                                .font(.custom("Poppins-SemiBold", size: 25))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                isPresenting.toggle()
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 35))
                                    .foregroundStyle(.accent)
                            })
                        }
                    }
                    .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $isPresenting, content: {
            AddRecipeDetailsView()
        })
    }
}

#Preview {
    AddRecipeView()
}
