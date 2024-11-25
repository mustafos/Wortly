//
//  SettingsView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 25.11.2024.
//

import SwiftUI
import Kingfisher

let url = "https://images.seattletimes.com/wp-content/uploads/2023/07/07222023_swift_213100.jpg?d=2040x1479"

struct SettingsView: View {
    @ObservedObject var vm = SettingsViewModel()
    @State var isEditProfileViewOpen: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                if let userImage = vm.user?.profileImage {
                    KFImage(URL(string: userImage))
                        .resizable()
                        .scaledToFill()
                } else {
                    ProgressView()
                        .tint(.accentColor)
                }
            }
            .frame(width: 160, height: 160)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(style: .init(lineWidth: 5))
                    .fill(Color.accentColor)
            }
            
            VStack {
                if let userName = vm.user?.username {
                    Text("Hello, \(userName)")
                        .font(.custom("Poppins-Medium", size: 22))
                } else {
                    Text(".....")
                        .font(.custom("Poppins-Medium", size: 22))
                }
            }
            .padding(.top, 18)
            
            //Buttons
            VStack {
                VStack {
                    Button(action: {
                        Task {
                            isEditProfileViewOpen.toggle()
                        }
                    }, label: {
                        Text("Edit Profile")
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.accentColor)
                            .cornerRadius(35)
                            .padding()
                            .tint(.white)
                            .font(.custom("Poppins-Medium", size: 17))
                    })
                }
            }
        }
        .onAppear(perform: {
            Task {
                await vm.fetchUserDetails()
            }
        })
        .sheet(isPresented: $isEditProfileViewOpen) {
            EditProfileView(viewModel: vm)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    SettingsView()
}

