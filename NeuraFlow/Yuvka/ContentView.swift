//
//  ContentView.swift
//  NeuraFlow
//
//  Created by Mustafa Bekirov on 20.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var response: String = ""
    
    let apiKey = "YOUR_HUGGINGFACE_API_KEY"
    
    var body: some View {
        VStack {
            Text(response)
                .padding()
            
            Button("Get Response") {
                fetchData()
            }
            .padding()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api-inference.huggingface.co/models/gpt2") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: Any] = [
            "inputs": "Tell me a joke."
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            print("Error serializing request body: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let output = jsonResponse["generated_text"] as? String {
                    DispatchQueue.main.async {
                        self.response = output
                    }
                }
            } catch {
                print("Error parsing response: \(error)")
            }
        }
        
        task.resume()
    }
}
