//
//  ConfigurationLoader.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 28.11.2025.
//

import Foundation

struct Config: Codable {
    let spoonacularAPIKey: String
}

struct ConfigLoader {
    static func loadConfig() -> Config? {
        // load all the info from config..
        guard let url = Bundle.main.url(forResource: "config", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load config file")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            let config = try decoder.decode(Config.self, from: data)
            print("Loaded the config \(config)")
            return config
        } catch {
            print("Failed to load config file | with error -> \(error.localizedDescription)")
            return nil
        }
    }
}
