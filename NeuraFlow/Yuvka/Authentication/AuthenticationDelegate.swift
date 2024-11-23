//
//  AuthenticationDelegate.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 23.11.2024.
//

import Foundation

protocol AuthenticationDelegate: AnyObject {
    func didLoginSuccessFully(state: Bool)
}
