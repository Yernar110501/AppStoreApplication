//
//  SearchResults.swift
//  AppStoreApplication
// 
//  Created by Yernar Baiginzheyev on 09.05.2024.
//

import Foundation


/// Model which represents result of searching with count
struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
/// Model which represents result of searching
struct Result: Decodable {
    let trackName: String?
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: URL
    let screenshotUrls: [URL]?
}
