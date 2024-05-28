//
//  Reviews.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 29.05.2024.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewsFeed
}

struct ReviewsFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
