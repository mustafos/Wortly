//
//  SearchBar.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                TextField(text: $searchText) {
                    Text("Search your recipe")
                        .font(.custom("Poppins-Medium", size: 17))
                }
            }
            .padding()
            .frame(height: 45)
            .background(.crispyCrust)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .padding(20)
        }
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}

