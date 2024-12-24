//
//  BundleExt.swift
//  wortly
//
//  Created by Mustafa Bekirov on 16.12.2024.
//

import Foundation

extension Bundle {

    /// App's current version.
    static var version: String? { return main.infoDictionary?["CFBundleShortVersionString"] as? String }
}
