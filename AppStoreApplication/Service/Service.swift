//
//  Service.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 09.05.2024.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init () {}
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> () ) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            if let error {
                print("Failed to fetch apps with error: ", error)
                completion([], error)

                return
            }
            guard let data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("Failed to decode json with error: ",  error)
                completion([], error)

            }
            
        }.resume()
    }
}
