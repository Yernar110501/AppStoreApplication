//
//  AppGroup.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 19.05.2024.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
    
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]

}

struct FeedResult: Decodable {
    let artistName: String
    let id: String
    let name: String
    let artworkUrl100: URL?
}
