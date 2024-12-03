//
//  IngredientsFinderOptionsView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 30.11.2024.
//

import SwiftUI

struct IngredientsFinderOptionsView: View {
    @State var isCameraOpen: Bool = false
    @State var isSearchViewOpen: Bool = false
    @State var isSearchViewOpenByIngredients: Bool = false
    
    let vm = IngredientsFinderOptionsViewModel()
    
    let IngredientsFinderVCWrapper = UIKitViewControllerWrapper(viewController: IngredientsFinderWithCameraViewController())
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Find recipes that you desire")
                                .font(.custom("Poppins-Medium", size: 31))
                            
                            Spacer()
                            
                            Image(systemName: "fork.knife.circle")
                                .font(.system(size: 58))
                        }
                    }
                    .padding([.horizontal],20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: Options Grid View
                    VStack {
                        VStack {
                            HStack(spacing: 10) {
                                LargeSizeOptionBox(title: "Search an image in real time", bgColor: .indigo, icon: "camera", action: {
                                    isCameraOpen.toggle()
                                }
                                )
                                
                                VStack(spacing: 10) {
                                    MediumSizeOptionBox(title: "Search By Ingredients", bgColor: Color.accentColor, icon: "takeoutbag.and.cup.and.straw", action: {
                                        isSearchViewOpenByIngredients
                                            .toggle()
                                    }
                                    )
                                    
                                    MediumSizeOptionBox(title: "Search a specific recipe", bgColor: .crispyCrust, icon: "magnifyingglass", action: {
                                        isSearchViewOpen.toggle()
                                    }
                                    )
                                }
                            }
                        }
                        .padding(10)
                        .frame(width: 350, height: 360)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.top, 45)
        }
        .fullScreenCover(
            isPresented: $isSearchViewOpenByIngredients,
            content: {
                SearchByIngredientsView()
            }
        )
        .fullScreenCover(isPresented: $isSearchViewOpen, content: {
            SearchRecipeByNameView(viewModel: vm)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        })
        .fullScreenCover(isPresented: $isCameraOpen, content: {
            IngredientsFinderVCWrapper
                .presentationBackground(.black)
        })
        .ignoresSafeArea()
    }
}

#Preview {
    IngredientsFinderOptionsView()
}
