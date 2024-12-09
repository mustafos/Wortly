//
//  RecipeCellViewLarge.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 05.12.2024.
//

import SwiftUI
import Kingfisher

struct RecipeCellViewLarge: View {
    let data: FetchedRecipeByIngredients
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack {
                        KFImage(URL(string: data.image))
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: 120)
                    .clipped()
                    
                    VStack(spacing:8) {
                        VStack {
                            Text(data.title)
                                .font(.custom("Poppins-Medium", size: 16))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 53, alignment: .topLeading)
                        
                        VStack(alignment: .leading, spacing:8) {
                            Text("Missing Items: \(data.missedIngredientsCount())")
                                .font(.custom("Poppins-Medium", size: 14))
                            
                            Text(data.getArrayIntoStringForm(which: .missed))
                                .font(.custom("Poppins-Regular", size: 13))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                    .padding([.top, .bottom],11)
                    .padding([.horizontal], 7)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                }
                .frame(height: 160)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.crispyCrust)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .padding(10)
    }
}

#Preview {
    RecipeCellViewLarge(
        data: .init(
            id: 2,
            title: "Chicken Barbque Chicken Barbque Chicken Barbque Chicken Barbque",
            image: "",
            missedIngredients: [.init(name: "Chicken", image: ""),.init(name: "dsd", image: ""), .init(name: "Chicken", image: ""),.init(name: "sas", image: ""),.init(name: "sasd", image: ""), .init(name: "Chicken", image: ""),.init(name: "Chicken", image: ""),.init(name: "Chicken", image: ""), .init(name: "Chicken", image: "")],
            usedIngredients: [.init(name: "Chicken", image: ""),.init(name: "Chicken", image: ""),.init(name: "Chicken", image: "")]
        )
    )
}
