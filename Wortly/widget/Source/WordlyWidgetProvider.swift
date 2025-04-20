//
//  WordlyWidgetProvider.swift
//  wortly
//
//  Created by Mustafa Bekirov on 26.12.2024.
//

import SwiftUI
import WidgetKit
import NetworkKit
import Intents

struct WordlyWidgetProvider: IntentTimelineProvider {
    
    public typealias ViewModel = WordlyWidgetViewModel
    
    private let calendar = Calendar.current
    
    func placeholder(in context: Context) -> ViewModel {
        print("WordlyWidgetProvider: placeholder")
        return ViewModel(date: Date(), wordOfTheDay: Self.sampleWordOfTheDay, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ViewModel) -> Void) {
        print("WordlyWidgetProvider: getSnapshot")
        
        let entry = ViewModel(date: Date(), wordOfTheDay: Self.sampleWordOfTheDay, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<ViewModel>) -> Void) {
        print("WordlyWidgetProvider: getTimeline")
        
        let currentDate = Date()
        guard let refreshDate = calendar.date(byAdding: .hour, value: 4, to: currentDate) else { return }
        
        API.getWordOfTheDay(for: currentDate) { result in
            var entry: ViewModel
            
            switch result {
            case .success(let wordOfTheDay):
                print("WordlyWidgetProvider: getTimeline success")
                entry = ViewModel(date: currentDate, wordOfTheDay: wordOfTheDay, configuration: configuration)
                
            case .failure(let error):
                print("WordlyWidgetProvider: getTimeline failure \(error.localizedDescription)")
                entry = ViewModel(date: currentDate, wordOfTheDay: nil, configuration: configuration)
            }
            
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}

extension WordlyWidgetProvider {
    
    static var sampleWordOfTheDay: WordOfTheDayDTO {
        return WordOfTheDayDTO(
            word: "nomothetic",
            note: "The word 'nomothetic' comes from a Greek word meaning 'relating to legislation'",
            definitions: [
                DefinitionDTO(
                    source: "century",
                    text: "Noting a science which aims",
                    note: nil,
                    partOfSpeech: "adjective"
                )
            ],
            examples: [
                ExampleDTO(
                    title: "The Bass Handbook of Leadership",
                    text: "The nomothetic approach tries to draw inferences from a more limited exposure to a large number of cases.",
                    id: 1121006194
                )
            ]
        )
    }
}

