//
//  ImagePicker+Coordinator.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 24.02.2025.
//

import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    var delegate: AddRecipePhotoDelegate
    
    init(delegate: AddRecipePhotoDelegate) {
        self.delegate = delegate
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self, delegate: delegate)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    var delegate: AddRecipePhotoDelegate
    
    init(parent: ImagePicker, delegate: AddRecipePhotoDelegate) {
        self.parent = parent
        self.delegate = delegate
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[.originalImage] as? UIImage {
            delegate.didSetThePhoto(uiImage)
            print("Called function")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
