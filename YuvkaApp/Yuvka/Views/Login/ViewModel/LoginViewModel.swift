//
//  LoginViewModel.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 23.11.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailInput : String = ""
    @Published var password   : String = ""
}
