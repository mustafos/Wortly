//
//  APIConfiguration.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 28.11.2024.
//

import Foundation

struct ApiConfig {
    static func getAPIKey() -> String? {
        guard let apiKey = ConfigLoader.loadConfig()?.spoonacularAPIKey else {
            return nil
        }
        return apiKey
    }
}
