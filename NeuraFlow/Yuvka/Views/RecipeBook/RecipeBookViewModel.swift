//
//  RecipeBookViewModel.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RecipeItems: Codable{
    let recipesArray: [RecipeModel]
}

class RecipeBookViewModel: ObservableObject {
    @Published var recipeItems: [RecipeModel]?
    @Published var isFetchingRecipes: Bool = false
    @Published var user: UserModel?
    
    let db = Firestore.firestore()

    init() {
        Task {
            await fetchRecipeItems()
            await fetchUserDetails()
        }
    }
    
    @MainActor
    func fetchUserDetails() async {
        guard let user = Auth.auth().currentUser else {
            print("Found No Current User Darling ")
            return
        }
        
        let docRef = db.collection("users").document(user.uid)
        
        do {
            print("Fetching User Details....")
            let res = try await docRef.getDocument()
            let data = try res.data(as: UserModel.self)
            self.user = data
            print("Got the registerd user data", data)
        } catch {
            print("Oops error in fetching User Details", error.localizedDescription)
        }
    }
    
    func refreshData() async {
        await fetchRecipeItems()
    }
    
    @MainActor
    func fetchRecipeItems() async  {
        guard let user = Auth.auth().currentUser else {
            print("Found No Current User Darling ")
            return
        }

        let docRef = db.collection("recipes").document(user.uid)
                
        do {
            isFetchingRecipes = true
            let res = try await docRef.getDocument()
            let data = try res.data(as: RecipeItems.self)
            recipeItems = data.recipesArray
            isFetchingRecipes = false
        } catch {
            print("Oops error in fetching ", error.localizedDescription)
            isFetchingRecipes = false
        }
    }
}
