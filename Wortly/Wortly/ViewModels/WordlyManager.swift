//
//  WordlyManager.swift
//  wortly
//
//  Created by Mustafa Bekirov on 16.12.2024.
//

import SwiftUI

class WordlyManager: ObservableObject {
    
    // Localized String Keys
      @Published var title: String = LocalizedStringsManager.shared.title
      @Published var definitionText: String = LocalizedStringsManager.shared.definitionText
      @Published var exampleText: String = LocalizedStringsManager.shared.exampleText
      @Published var originText: String = LocalizedStringsManager.shared.originText
      
      // Accessibility Labels
      @Published var definitionAccessibilityLabel: String?
      @Published var exampleAccessibilityLabel: String?
      @Published var originAccessibilityLabel: String?
      @Published var wordOfTheDayAccessibilityLabel: String?
      @Published var partOfSpeechAccessibilityLabel: String?
      @Published var audioButtonAccessibilityLabel: String = LocalizedStringsManager.shared.audioButtonAccessibilityLabel
      

    @Published var word = ""
    @Published var partOfSpeech = ""
    @Published var wordDescription = ""
    @Published var wordExample = ""
    @Published var origin = ""
    
    func fetchData() {
        print("WordOfTheDayViewModel: fetchData")
        API.getWordOfTheDay(for: Date()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordOfTheDayResponse):
                
                if self.word != wordOfTheDayResponse.word {
                    self.refreshWidget()
                }
                
                self.word = wordOfTheDayResponse.word  ?? ""
                self.partOfSpeech = wordOfTheDayResponse.definitions?.first?.partOfSpeech ?? ""
                self.wordDescription = wordOfTheDayResponse.definitions?.first?.text ?? ""
                self.wordExample = wordOfTheDayResponse.examples?.first?.text ?? ""
                self.origin = wordOfTheDayResponse.note  ?? ""
                
                self.setupAccessibilityLabels()
                
            case .failure:
                break
            }
        }
    }
