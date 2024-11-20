//
//  ContentView.swift
//  NeuraFlow
//
//  Created by Mustafa Bekirov on 20.11.2024.
//

import SwiftUI

struct ContentView: View {
    private let apiKey = "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"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                let api = NeuraAPI(apiKey: apiKey)
                do {
                    let stream = try await api.sendMessageStream(text: "What the Hell is it?")
                    for try await line in stream {
                        print(line)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
