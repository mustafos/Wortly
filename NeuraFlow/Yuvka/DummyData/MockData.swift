//
//  MockData.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 08.12.2024.
//

import Foundation

struct Recipe: Hashable {
    let name: String
    let image: String
    let description: String
}

class DummyData {
    var foods : [Recipe] =
    [
        .init(name: "Tacos", image: "food1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet justo elit. Sed ultricies eget justo in ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum "),
        .init(name: "Chilaquiles", image: "food2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet justo elit. Sed ultricies eget justo in ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum "),
        .init(name: "Pazole", image: "food3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet justo elit. Sed ultricies eget justo in ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum ")
    ]
}
