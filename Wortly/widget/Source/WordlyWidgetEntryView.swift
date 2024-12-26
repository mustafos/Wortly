//
//  WordlyWidgetEntryView.swift
//  wortly
//
//  Created by Mustafa Bekirov on 21.04.2025.
//

import SwiftUI
import WidgetKit

struct WordlyWidgetEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    @ObservedObject var viewModel: WordlyWidgetViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if viewModel.word.isEmpty {
                Text(viewModel.errorText)
                    .modifier(BodyStyle())
            } else {
                Text(viewModel.word)
                    .modifier(TitleStyle())
                    .accessibility(label: Text(viewModel.wordOfTheDayAccessibilityLabel ?? ""))
                
                VStack(alignment: .leading) {
                    Text(viewModel.definitionText)
                        .modifier(SubTitleStyle())
                    Text(viewModel.wordDescription)
                        .modifier(BodyStyle())
                }
                .minimumScaleFactor(0.95)
                .accessibilityElement(children: .combine)
                .accessibility(label: Text(viewModel.definitionAccessibilityLabel ?? ""))
                
                if case .systemLarge = widgetFamily {
                    VStack(alignment: .leading) {
                        Text(viewModel.exampleText)
                            .modifier(SubTitleStyle())
                        Text(viewModel.wordExample)
                            .modifier(BodyStyle())
                    }
                    .accessibilityElement(children: .combine)
                    .accessibility(label: Text(viewModel.exampleAccessibilityLabel ?? ""))
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.originText)
                            .modifier(SubTitleStyle())
                        Text(viewModel.origin)
                            .modifier(BodyStyle())
                    }
                    .accessibilityElement(children: .combine)
                    .accessibility(label: Text(viewModel.originAccessibilityLabel ?? ""))
                }
                
                #if DEBUG
                //Text(DateFormatter.defaultDateFormatter.string(from: viewModel.date))
                //    .modifier(SubTitleStyle())
                #endif
                
                Spacer()
            }
        }.padding()
    }
}

struct WordlyWidgetEntryView_Preview: PreviewProvider {
    static var previews: some View {
        return WordlyWidgetEntryView(
            viewModel: WordlyWidgetViewModel(
                date: Date(),
                wordOfTheDay: WordlyWidgetProvider.sampleWordOfTheDay,
                configuration: ConfigurationIntent()
            )
        ).previewContext(WidgetPreviewContext(family: .systemMedium))
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
}

