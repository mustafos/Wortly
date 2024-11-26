//
//  GetStringFromArray.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 26.11.2024.
//

import Foundation

enum GetStringFromArray {
    case withWhiteSpace(array: [String])
    case withoutWhiteSpace(Array: [String])
    
    var getString: String {
        switch self {
        case .withWhiteSpace(let arr):
            let formattedString =  arr.joined(separator: ", ")

            return formattedString
        case .withoutWhiteSpace(let arr):
            let formattedString =  arr.joined(separator: ",")
            
            return formattedString
        }
    }
}
