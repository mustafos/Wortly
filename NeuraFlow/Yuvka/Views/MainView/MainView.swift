//
//  MainView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 20.11.2024.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var AuthManager = AuthenticationManager.shared
    var body: some View {
        Group{
            if AuthManager.isLoggedIn {
                TabbarView()
            }else{
                WelcomeView()
            }
     
        }
    }
}

#Preview {
    MainView()
}
