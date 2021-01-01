//
//  NetworkManager.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 11/12/2020.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://api.nytimes.com/svc/"
    private let apiKey = "iIzsaMfgygBpoDQAwtr02QXIAdZsNQFt"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getMostViewedArticles(in period: Period, completed: @escaping (Result<PopularArticlesData, NYTimesError>) -> Void) {
        let endpoint = baseURL + "mostpopular/v2/viewed/\(period.rawValue).json?api-key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.incorrectURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.noInternetConnection))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidServerResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let articlesData = try decoder.decode(PopularArticlesData.self, from: data)
                completed(.success(articlesData))
            } catch {
                print("JSON decoding failed: \(error)")
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}

enum Period: Int {
    case day = 1
    case week = 7
    case month = 30
}
