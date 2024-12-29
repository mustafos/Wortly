//
//  WordlyView.swift
//  watch Watch App
//
//  Created by Mustafa Bekirov on 29.12.2024.
//

import SwiftUI

struct WordlyView: View {
    
    @ObservedObject var viewModel: WordlyViewModel
    
    var body: some View {
        VStack {
            if viewModel.word == "" {
                ProgressView()
            } else {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(viewModel.word)
                            .modifier(TitleStyle())

                        VStack(alignment: .leading) {
                            Text(viewModel.definitionText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.wordDescription)
                                .modifier(BodyStyle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.exampleText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.wordExample)
                                .modifier(BodyStyle())
                        }
                        VStack(alignment: .leading) {
                            Text(viewModel.originText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.origin)
                                .modifier(BodyStyle())
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: WKExtension.applicationWillEnterForegroundNotification)) { _ in
            print("WordOfTheDayView: willEnterForegroundNotification")
            viewModel.fetchData()
        }
        .onAppear {
            print("WordOfTheDayView: onAppear")
            viewModel.fetchData()
        }
    }
}
