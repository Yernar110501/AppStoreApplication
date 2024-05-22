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
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> () ) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJsonData(urlString: urlString, completion: completion)
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
       fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    func fetchSocial(completion: @escaping([SocialApp]?, Error?) -> () ) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJsonData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> () ) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error {
                print("Failed to fetch social header with: ", error)
                completion(nil, error)
                return
            }
            
            guard let data else { return }
            
            do  {
                let socialApps = try JSONDecoder().decode(T.self, from: data)
                completion(socialApps, nil)
            } catch {
                print("Failed to parse data with: ", error)
                completion(nil, error)
            }
            
        }.resume()
    }
}
