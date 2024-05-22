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
    
    func fetchTopFreeApps(completion: @escaping(AppGroup?, Error?) -> () ) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-free/25/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopPaydApps(completion: @escaping(AppGroup?, Error?) -> () ) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-paid/25/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    
    func fetchAppGroup(urlString: String, completion: @escaping(AppGroup?, Error?) -> () ) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            if let error {
                print("Failed to fetch top free apps with: ", error)
                completion(nil, error)
                return
            }
            
            guard let data else { return }
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
//                print(appGroup.feed.results.forEach{ print($0.name) })
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
                print("Failed decode json with error: ", error)
            }
            
        }.resume()
    }
    
    func fetchSocial(completion: @escaping([SocialApp]?, Error?) -> () ) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error {
                print("Failed to fetch social header with: ", error)
                completion(nil, error)
                return
            }
            
            guard let data else { return }
            
            do  {
                let socialApps = try JSONDecoder().decode([SocialApp].self, from: data)
                completion(socialApps, nil)
            } catch {
                print("Failed to parse data with: ", error)
                completion(nil, error)
            }
            
        }.resume()
    }
}
