//
//  NetworkManager.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 05/01/2022.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager() // Singleton
    
    private init() {}
    
    static let baseURL = "https://api.github.com/users/allegro/"
    private let repoURL = baseURL + "repos"
    
    func getRepos(completed: @escaping (Result<[GitRepo], RepoError>) -> Void) {
        guard let url = URL(string: repoURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([GitRepo].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
