//
//  CategoriesSelectionView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 02.12.2024.
//

import SwiftUI

struct CategoriesSelectionView: View {
    @Binding var category: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(Category.allCases) { catg in
                    VStack {
                        Text("\(catg.rawValue)")
                            .padding(.horizontal, 8)
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(.crispyCrust)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .onTapGesture {
                        category.append(catg.rawValue)
                    }
                }
            }
        }.padding(8)
    }
}

#Preview {
    CategoriesSelectionView(category: .constant([""]))
}
