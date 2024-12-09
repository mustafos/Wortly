//
//  AddRecipeViewModel.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 29.11.2024.
//

import SwiftUI
import Combine
import PhotosUI
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

class AddRecipeViewModel: ObservableObject, AddRecipePhotoDelegate {
    @Published var selectedImage: UIImage?
    @Published var currentUser: FirebaseAuth.User?
    @Published var isLoading:Bool = false
    @Published var progress: Float = 0.0
    
    var cancellable = Set<AnyCancellable>()
    
    @MainActor
    @Published var pickedItem: PhotosPickerItem? {
        didSet { Task {
            if let pickedItem,
               let data = try? await pickedItem.loadTransferable(type: Data.self){
                if let image = UIImage(data: data){
                    selectedImage = image
                }
            }
            pickedItem = nil
        }}
    }
    
    init() {
        setUpSubscriberForCurrentUser()
    }
    
    private func setUpSubscriberForCurrentUser() {
        AuthenticationManager.shared.$userSession.sink { user in
            guard let user = user else {
                print("Could'nt fetch the user from userSession")
                return
            }
            self.currentUser = user
            print("Got the user id => \(self.currentUser?.uid)")
        }.store(in: &cancellable)
    }
    
    func didSetThePhoto(_ image: UIImage) {
        selectedImage = image
    }
    
    func uploadImage() async throws -> String? {
        guard let imageData = selectedImage?.jpegData(compressionQuality: 0.30) else {
            print("No Image")
            return nil
        }
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/recipe_images/\(fileName)")
        
        do {
            let _ =  try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print(error)
            return nil
        }
    }
    
    @MainActor
    func uploadRecipe(name: String, ingredients: [Ingredients], instructions: String, category: [String], preprationTime: String, cookingTime: String, note: String) async throws {
        
        guard let uid = currentUser?.uid else {
            print("Couldn't get the uid")
            return
        }
        
        isLoading = true
        
        guard let imageUrl = try await uploadImage() else {
            print("Could'nt get the url")
            return
        }
        
        let recipe = RecipeModel(
            id: UUID(),
            name: name,
            imageUrl: imageUrl,
            ingredients: ingredients,
            instructions: instructions,
            Note: note,
            category: category,
            preprationTime: preprationTime,
            cookingTime: cookingTime
        )
        
        guard let recipeData = try? Firestore.Encoder().encode(recipe) else {return}
        
        do {
            let db = Firestore.firestore()
            let data =  try await db.collection("recipes").document(uid).getDocument()
            if data.exists{
                try await Firestore
                    .firestore()
                    .collection("recipes")
                    .document(uid)
                    .updateData(["recipesArray": FieldValue.arrayUnion([recipeData])])
            } else {
                try await Firestore
                    .firestore()
                    .collection("recipes")
                    .document(uid)
                    .setData(["recipesArray": [recipeData]])
            }
            isLoading = false
            print("Done...")
        } catch {
            print("Oops error in uploading the recipe", error.localizedDescription)
        }
    }
}
