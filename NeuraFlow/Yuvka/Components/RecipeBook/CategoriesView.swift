//
//  CategoriesView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var selectedCatg: Category
    
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(
                        Category.allCases
                    ) { category in
                        HStack(spacing: 7) {
                            Text(category.rawValue)
                        }
                        .padding(.horizontal, 16)
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(selectedCatg == category ? .white : .secondary)
                        .frame(height: 38)
                        .background(selectedCatg == category ? .accent: Color(.crispyCrust))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selectedCatg = category
                            }
                        }
                    }
                }.padding()
            }.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CategoriesView(selectedCatg: .constant(.all))
}

