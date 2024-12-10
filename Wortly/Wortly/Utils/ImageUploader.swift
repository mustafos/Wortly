//
//  ImageUploader.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 23.02.2025.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(withImage image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.30) else { return nil }
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
}
