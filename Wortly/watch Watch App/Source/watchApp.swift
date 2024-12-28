//
//  watchApp.swift
//  watch Watch App
//
//  Created by Mustafa Bekirov on 27.12.2024.
//

import SwiftUI

@main
struct watch_Watch_AppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WordlyView(viewModel: .init())
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
