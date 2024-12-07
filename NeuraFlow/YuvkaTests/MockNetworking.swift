//
//  MockNetworking.swift
//  YuvkaTests
//
//  Created by Mustafa Bekirov on 07.12.2024.
//

import Foundation

class MockNetworking {
    func fetchRecipeInfo(query: String) -> Data? {
        let jsonString = """
            {
                "id": "1",
                "title": "Pasta Chicken"
                "image": "image"
                "dishTypes" ["main", "dinner"]
                "servings": 2
                "readyInMinutes": 12
                "summary": "this is a sample recipe"
            }
        """
        if let data = jsonString.data(using: .utf8) {
            return data
        } else {
            let error = NSError(domain: "MockNetworkingServiceErrorDomain", code: -1, userInfo: nil)
            return nil
        }
    }
}

