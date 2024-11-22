//
//  NeuraAPI.swift
//  NeuraFlow
//
//  Created by Mustafa Bekirov on 20.11.2024.
//

//import Foundation
//
//class NeuraAPI {
//    private let apiKey: String
//    private let urlSession = URLSession.shared
//    private var urlRequest: URLRequest {
//        let url = URL(string: "https://api.openai.com/v1/completions")!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        headers.forEach {  urlRequest.setValue($1, forHTTPHeaderField: $0) }
//        return urlRequest
//    }
//    
//    private let basePrompt: String = "Hi, I'm NeuraFlow. How can I help you today?"
//    private let jsonDecoder = JSONDecoder()
//    
//    private var headers: [String: String] {
//        [
//            "Content-Type": "application/json",
//            "Authorization": "Bearer \(apiKey)"
//        ]
//    }
//    
//    init(apiKey: String) {
//        self.apiKey = apiKey
//    }
//    
//    private func generateChatGPTPrompt(from text: String) -> String {
//        return basePrompt + "User: \(text)\n\n\nChatGPT:"
//    }
//    
//    private func jsonBody(text: String, stream: Bool = true) throws -> Data {
//        let jsonBody: [String: Any] = [
//            "model": "text-chat-davinci-002-20230126",
//            "temperature": 0.5,
//            "max_tokens": 1024,
//            "prompt": generateChatGPTPrompt(from: text),
//            "stop": [
//                "\n\n\n",
//                "<|im_end|>"
//            ],
//            "stream": stream
//        ]
//        return try JSONSerialization.data(withJSONObject: jsonBody)
//    }
//    
//    func sendMessageStream(text: String) async throws -> AsyncThrowingStream<String, Error> {
//        var urlRequest = self.urlRequest
//        urlRequest.httpBody = try jsonBody(text: text)
//        
//        let (result, response) = try await urlSession.bytes(for: urlRequest)
//        
//        guard let httpResponse = response as? HTTPURLResponse else {
//            throw "Invalide response"
//        }
//        
//        guard 200...299 ~= httpResponse.statusCode else {
//            throw "Bad Response: \(httpResponse.statusCode)"
//        }
//        
//        return AsyncThrowingStream { [weak self] in
//            guard let self else { return nil }
//            for try await line in streams {
//                try Task.checkCancellation()
//                if line.hasPrefix("data: "),
//                   let data = line.dropFirst(6).data(using: .utf8),
//                   let response = try? self.jsonDecoder.decode(StreamCompletionResponse.self, from: data),
//                   let text = response.choices.first?.delta.content {
//                    responseText += text
//                    return text
//                }
//            }
//            self.appendToHistoryList(userText: text, responseText: responseText)
//            return nil
//        }
//    }
//}
//
//extension String: Error {}
//
//struct CompletionResponse: Decodable {
//    let choices: [Choice]
//}
//
//struct Choice: Decodable {
//    let text: String
//}
