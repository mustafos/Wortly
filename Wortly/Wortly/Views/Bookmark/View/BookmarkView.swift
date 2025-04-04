//
//  BookmarkView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 26.11.2024.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var vm = BookmarksViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if !vm.isFetching {
                    if vm.bookmarks != nil {
                        ScrollView {
                            VStack {
                                Text("Bookmarks")
                                    .font(.custom("Poppins-Medium", size: 29))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(Color.accentColor)
                                    .padding(.leading, 10)
                                
                                VStack {
                                    HStack(spacing: 20) {
                                        Image(systemName: "magnifyingglass")
                                            .imageScale(.large)
                                        TextField(text: .constant("")) {
                                            Text("Search your recipe")
                                                .font(.custom("Poppins-Medium", size: 17))
                                        }
                                    }
                                    .padding()
                                    .frame(height: 55)
                                    .background(.crispyCrust)
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                }
                                
                            }
                            .padding(.bottom, 14)
                            
                            VStack(spacing: 15) {
                                ForEach(vm.bookmarks?.recipes ?? [], id:
                                            \.self) { recipe in
                                    NavigationLink(value: recipe) {
                                        RecipeRowCellView(recipeData: recipe)
                                            .tint(.primary)
                                    }
                                }
                            }
                            
                            if let userCreatedRecipes = vm.bookmarks?.userCreatedRecipes {
                                VStack {
                                    VStack {
                                        Text("Your Own Recipes")
                                            .font(.custom("Poppins-Medium", size: 29))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundStyle(Color.accentColor)
                                            .padding(.leading, 10)
                                    }
                                    
                                    VStack(spacing: 15) {
                                        ForEach(
                                            userCreatedRecipes,
                                            id: \.self ) { recipe in
                                                NavigationLink(value: recipe) {
                                                    RecipeCellViewUsersRecipes(recipeData: recipe)
                                                        .tint(.primary)
                                                }
                                            }
                                    }
                                }
                                .padding(.top, 10)
                            }
                        }
                        .scrollIndicators(.hidden)
                    } else {
                        VStack {
                            Text("No Bookmarks Found")
                                .font(.custom("Poppins-Medium", size: 19))
                        }
                    }
                } else {
                    VStack {
                        Text("Loading..")
                            .font(.custom("Poppins-Medium", size: 19))
                    }
                }
            }
            .navigationDestination(for: RecipeModel.self, destination: { recipe in
                UserRecipesView(recipeData: recipe)
                    .navigationBarBackButtonHidden()
            })
            .navigationDestination(for: FetchedRecipe.self, destination: { recipe in
                RecipeDetailsView(recipeData: recipe)
                    .navigationBarBackButtonHidden()
            })
            .padding(.top, 80)
            .padding(.horizontal, 15)
            .ignoresSafeArea()
        }
        .onAppear {
            Task {
                if vm.bookmarks == nil {
                    await vm.getBookmarks()
                }
            }
        }
    }
}

#Preview {
    BookmarkView()
}
