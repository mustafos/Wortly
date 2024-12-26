//
//  AppIntent.swift
//  widget
//
//  Created by Mustafa Bekirov on 26.12.2024.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct WordlyWidget: Widget {
    
    static let kind: String = "WordlyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: WordlyWidget.kind, intent: ConfigurationIntent.self, provider: WordlyWidgetProvider()) { viewModel in
            WordOfTheDayWidgetEntryView(viewModel: viewModel)
        }
        .configurationDisplayName(LocalizedStringKey("display_name"))
        .description(LocalizedStringKey("description"))
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}
