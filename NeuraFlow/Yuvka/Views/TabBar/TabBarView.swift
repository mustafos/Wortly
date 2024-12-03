//
//  TabBarView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 24.11.2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: SelectedTabs = .Book
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RecipeBookView()
                .tabItem {
                    Image(systemName: "book")
                }
                .tag(SelectedTabs.Book)
            
            IngredientsFinderOptionsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(SelectedTabs.Search)
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark")
                }
                .tag(SelectedTabs.Bookmark)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(SelectedTabs.Settings)
        }
        .padding(.top, 10)
        .tint(.accentColor)
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
