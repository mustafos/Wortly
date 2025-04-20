//
//  SettingsView.swift
//  wortly
//
//  Created by Mustafa Bekirov on 15.12.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    @Binding var showingSettings: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                List {
                    Section(footer: footer) {
                        ForEach(viewModel.items, id: \.rawValue) { item in
                            Button(action: { handleTapOnItem(item) }) {
                                SettingRow(item: item)
                            }
                        }
                    }
                    
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationBarTitle(Text(viewModel.title), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.showingSettings.toggle()
                }) {
                    Text(viewModel.closeText)
                }
            )
        }
    }
    
    var footer: some View {
        Bundle.version
            .map { Text("app.version.\($0)") }
            .modifier(FooterStyle())
    }
    
    private func handleTapOnItem(_ item: SettingItem) {
        switch item {
        case .feedback: openURL(viewModel.appStoreURL)
        case .openSource: openURL(viewModel.gitHubRepoURL)
        }
    }

    private func openURL(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        print("SettingsView: openURL \(url.absoluteString)")
        UIApplication.shared.open(url)
    }
}
