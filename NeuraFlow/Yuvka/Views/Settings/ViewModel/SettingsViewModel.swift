//
//  SettingsViewModel.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 25.11.2024.
//

import SwiftUI
import PhotosUI
import Firebase

class SettingsViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var username   : String = ""
    @Published var selectedImage: UIImage?
    @Published var isUploading = false
    
    @MainActor
    @Published var pickedItem: PhotosPickerItem? {
        didSet {
            Task {
                if let pickedItem,
                   let data = try? await pickedItem.loadTransferable(type: Data.self){
                    if let image = UIImage(data: data){
                        selectedImage = image
                    }
                }
                pickedItem = nil
            }}
    }
    
    @MainActor
    func fetchUserDetails() async {
        do {
            user = try await AuthenticationManager.shared.fetchUserDetails()
        } catch {
            print("Error in fetching user details -> \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func uploadEditedInfo() async {
        
        let db = Firestore.firestore()
        
        guard let userdata = user else { return }
        guard let image = selectedImage else { return }
        
        isUploading = true
        guard let imageUrl = try? await ImageUploader.uploadImage(withImage: image) else { return }
        
        let userRef = db.collection("users").document(userdata.uid)
        
        do {
            try await userRef.updateData([
                "username": username,
                "profileImage": imageUrl
            ])
            print("User profile updated successfully!")
            isUploading = false
        } catch {
            isUploading = false
            print("Failed to update user profile: \(error.localizedDescription)")
        }
    }
}
