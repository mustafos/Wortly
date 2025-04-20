//
//  SettingsViewModel.swift
//  wortly
//
//  Created by Mustafa Bekirov on 16.12.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {

    let title = LocalizedStringKey("settings.title")
    let closeText = LocalizedStringKey("settings.close")
    
    @Published private(set) var items: [SettingItem] = [.feedback, .openSource]

    let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id1551946328")!
    let gitHubRepoURL = URL(string: "https://github.com/kyledold/WordOfTheDay")!
}

enum SettingItem: Int {

    case feedback, openSource

    var title: LocalizedStringKey {
        switch self {
        case .feedback: return LocalizedStringKey("settings.feedback.title")
        case .openSource: return LocalizedStringKey("settings.open_source.title")
        }
    }

    var subtitle: LocalizedStringKey {
        switch self {
        case .feedback: return LocalizedStringKey("settings.feedback.subtitle")
        case .openSource: return LocalizedStringKey("settings.open_source.subtitle")
        }
    }

    var systemImageName: String {
        switch self {
        case .feedback: return "at"
        case .openSource: return "swift"
        }
    }

    var color: Color {
        switch self {
        case .feedback: return .green
        case .openSource: return .orange
        }
    }
}


