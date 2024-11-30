//
//  SearchByIngredientsViewModel.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 30.11.2024.
//

import Foundation

enum SearchMethods: String , CaseIterable {
    case SearchByTitle = "Search By Title"
    case SearchByName = "Search By Name"
}

class SearchByIngredientsViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var recipeData: [FetchedRecipeByIngredients]?
    
    let apiManager = APIManager(urlSession: .init(configuration: .default))
    
    @MainActor
    func fetchRecipe(with ingredients: String) async {
        do {
            isLoading = true
            let data = try await apiManager.fetchRecipeByIngredients(ingredients: ingredients)
            
            recipeData = data
            isLoading = false
        } catch {
            isLoading = false
            print("Error in fetching Recipe By Ingredients \(error.localizedDescription)")
        }
    }
}
