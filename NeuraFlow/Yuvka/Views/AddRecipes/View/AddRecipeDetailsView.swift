//
//  AddRecipeDetailsView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 29.11.2024.
//

import SwiftUI
import PhotosUI

struct AddRecipeDetailsView: View {
    @State private var timeUnit: TimeUnit = .minutes
    @State var title: String = ""
    @State var quantity: String = ""
    @State var nameOfIngredient: String = ""
    @State var ingredients: [Ingredients] = []
    @State var instructionsText: String = ""
    @State var note: String = ""
    @State var categoryInput: String = ""
    @State var preprationTime: String = ""
    @State var cookingTime: String = ""
    @State var category: [String] = []
    
    @State var categoriesSelected: Category = .all
    
    @State private var isKeyboardVisible: Bool = false
    @State var isCameraMenuOpen: Bool = false
    @State var isInstructionsInputOpen: Bool = false
    @State private var isImagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var isImageGallaryOpen: Bool = false
    @State private var isAddNoteOpen: Bool = false
    
    @Environment(\.dismiss) var dimissView
    @Environment(\.dismiss) var dismissView
    @ObservedObject var viewModel = AddRecipeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            Button(action: { dismissView() }, label: {
                                Text("Cancel")
                                    .font(.custom("Poppins-Medium", size: 18))
                                    .foregroundStyle(Color(.white))
                            })
                            Spacer()
                            Text("Add A Recipe")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(Color.accentColor)
                            Spacer()
                            Button {
                                Task {
                                    try await viewModel.uploadRecipe (
                                        name:           title,
                                        ingredients:    ingredients,
                                        instructions:   instructionsText,
                                        category:       category,
                                        preprationTime: preprationTime,
                                        cookingTime:    cookingTime,
                                        note:           note
                                    )
                                    dismissView()
                                }
                            } label: {
                                Text("Add")
                                    .font(.custom("Poppins-Medium", size: 18))
                                    .foregroundStyle(Color(.white))
                            }
                        }
                        .padding()
                        
                        VStack {
                            VStack(alignment: .leading) {
                                HStack(spacing: 40) {
                                    VStack {
                                        Button {
                                            isCameraMenuOpen.toggle()
                                        } label: {
                                            if let image = viewModel.selectedImage {
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 90, height: 90)
                                                
                                                
                                            } else {
                                                Image(systemName: "photo.fill")
                                                    .imageScale(.large)
                                                    .frame(width: 90, height: 90)
                                                    .background(Color(.crispyCrust))
                                                    .foregroundStyle(Color.accentColor)
                                            }
                                        }
                                    }
                                    .popover(isPresented: $isCameraMenuOpen, attachmentAnchor: .point(.trailing), arrowEdge: .bottom,  content: {
                                        VStack {
                                            Button {
                                                isImageGallaryOpen.toggle()
                                            } label: {
                                                HStack {
                                                    Image(systemName: "photo")
                                                        .foregroundStyle(Color.accentColor)
                                                    Text("Photos Library")
                                                        .font(.custom("Poppins-Regular", size: 18))
                                                        .foregroundStyle(.white)
                                                }
                                                .padding()
                                            }
                                            Button {
                                                isImagePickerPresented.toggle()
                                            } label: {
                                                HStack {
                                                    Image(systemName: "camera")
                                                        .foregroundStyle(Color.accentColor)
                                                    Text("Open Camera")
                                                        .font(.custom("Poppins-Regular", size: 18))
                                                        .foregroundStyle(.white)
                                                }.padding()
                                            }
                                        }
                                        .padding()
                                        .frame(minWidth: 40, minHeight: 40)
                                        .presentationCompactAdaptation(.popover)
                                    }).clipShape(Circle())
                                    
                                    VStack(alignment: .leading) {
                                        Text("Title or Name")
                                            .font(.custom("Poppins-Regular", size: 18))
                                        TextField(text: $title) {
                                            Text("Add a title")
                                                .font(.custom("Poppins-Regular", size: 21))
                                        }
                                    }
                                }
                                .padding(.leading)
                            }
                            .padding()
                            // Add iN
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Add Ingredients")
                                    .font(.custom("Poppins-Regular", size: 18))
                                if !ingredients.isEmpty {
                                    ForEach(ingredients, id: \.self) { ing in
                                        VStack {
                                            HStack(spacing: 20) {
                                                VStack {
                                                    Image(systemName: "carrot.fill")
                                                        .imageScale(.large)
                                                        .frame(width: 70, height: 70)
                                                        .background(Color(.crispyCrust))
                                                        .foregroundStyle(Color.accentColor)
                                                        .clipShape(Circle())
                                                }
                                                VStack(alignment: .leading) {
                                                    HStack(alignment: .center) {
                                                        VStack(alignment: .leading) {
                                                            Text("\(ing.quantity)")
                                                                .font(.custom("Poppins-Regular", size: 18))
                                                            
                                                            Text(ing.nameOfIngredient)
                                                                .font(.custom("Poppins-Regular", size: 18))
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        Button {
                                                            if  let index = ingredients.firstIndex(of: ing){
                                                                ingredients.remove(at: index)
                                                            }
                                                        } label: {
                                                            Image(systemName: "x.circle")
                                                                .foregroundStyle(Color.accentColor)
                                                                .imageScale(.medium)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                VStack {
                                    HStack(spacing: 20) {
                                        VStack {
                                            Button(action: {
                                                if !quantity.isEmpty && !nameOfIngredient.isEmpty {
                                                    let ingredient = Ingredients(quantity: quantity, nameOfIngredient: nameOfIngredient)
                                                    withAnimation(.spring) {
                                                        ingredients.append(ingredient)
                                                    }
                                                }
                                                quantity = ""
                                                nameOfIngredient = ""
                                                
                                            }, label: {
                                                Image(systemName: "plus")
                                                    .imageScale(.large)
                                                    .frame(width: 70, height: 70)
                                                    .background(.crispyCrust)
                                                    .foregroundStyle(Color.accentColor)
                                                    .clipShape(Circle())
                                            })
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            TextField(text: $quantity) {
                                                Text("Quantity")
                                                    .font(.custom("Poppins-Regular", size: 18))
                                            }
                                            TextField(text: $nameOfIngredient) {
                                                Text("Name of the Ingredien")
                                                    .font(.custom("Poppins-Regular", size: 18))
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                            
                            //Add a note
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Add Note")
                                    .font(.custom("Poppins-Regular", size: 18))
                                
                                Text(note.isEmpty ? "My mother makes this ": note)
                                    .font(.custom("Poppins-Regular", size: 18))
                                    .padding()
                                    .foregroundStyle(Color(.systemGray2))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(.crispyCrust))
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                    .onTapGesture {
                                        isAddNoteOpen.toggle()
                                    }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                            // Add Instructions
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Add Instructions")
                                    .font(.custom("Poppins-Regular", size: 18))
                                
                                Text(instructionsText.isEmpty
                                     ? "Tap to add instructions.."
                                     : instructionsText)
                                .font(.custom("Poppins-Regular", size: 18))
                                .padding()
                                .foregroundStyle(Color(.systemGray2))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.crispyCrust))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .onTapGesture {
                                    isInstructionsInputOpen.toggle()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                            //Add Catogories
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Add Category")
                                    .font(.custom("Poppins-Regular", size: 18))
                                // display categories list
                                if !category.isEmpty {
                                    HStack{
                                        ForEach(category , id: \.self) { catg in
                                            Text(catg)
                                                .padding(9)
                                                .font(.custom("Poppins-Medium", size: 16))
                                                .background(Color.accentColor)
                                                .foregroundStyle(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                                .onTapGesture {
                                                    withAnimation(.spring) {
                                                        if let index = category.firstIndex(of: catg) {
                                                            category.remove(at: index)
                                                        }
                                                    }
                                                }
                                        }
                                    }
                                }
                                
                                // MARK: CategoriesView for selection
                                CategoriesSelectionView(category: $category)
                            }
                            .padding()
                            
                            //Add prepartion time
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Add Durations")
                                    .font(.custom("Poppins-Regular", size: 18))
                                // prepration time picker(menu)
                                AddDurationView(timeUnit: $timeUnit,
                                                timeValue: $preprationTime, title: "Preparation Time")
                                
                                // prepration time picker(menu)
                                AddDurationView(timeUnit: $timeUnit,
                                                timeValue: $cookingTime, title: "Cooking Time")
                            }.padding()
                        }
                    }
                }
            }
            .photosPicker(isPresented: $isImageGallaryOpen, selection: $viewModel.pickedItem)
            .sheet(isPresented: $isAddNoteOpen, content: {
                AddNoteView(text: $note)
                
            })
            .sheet(isPresented: $isInstructionsInputOpen, content: {
                AddInstructionsSheetView(text: $instructionsText)
                
            })
            .fullScreenCover(isPresented: $isImagePickerPresented, content: {
                ImagePicker(delegate: viewModel).ignoresSafeArea()
            })
            .padding(.top, 50)
            .scrollIndicators(.hidden)
            .padding(.bottom, isKeyboardVisible ? 320 : 60)
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                withAnimation(.spring) {
                    isKeyboardVisible = true
                    print("Yes")
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                withAnimation(.spring) {
                    isKeyboardVisible = false
                    print("Yes")
                }
            }
            
            //Loading State
            if  viewModel.isLoading {
                VStack(spacing: 40) {
                    Image(systemName: "fork.knife.circle")
                        .font(.system(size: 80))
                        .foregroundStyle(Color.accentColor)
                    
                    Text("Please while we are uploading your recipe 🙃")
                        .font(.custom("Poppins-Medium", size: 17))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    ProgressView(value: viewModel.progress)
                        .frame(width: 250)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                        .foregroundStyle(Color.accentColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.thinMaterial)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    AddRecipeDetailsView()
}
