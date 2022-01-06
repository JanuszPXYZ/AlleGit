// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let repository = try? newJSONDecoder().decode(Repository.self, from: jsonData)

import Foundation

struct GitRepo: Identifiable, Codable {
    let id: Int
    let name: String
    let repositoryDescription: String?
    let language: String?
    let stargazersCount: Int
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case repositoryDescription = "description"
        case language
        case stargazersCount = "stargazers_count"
        case htmlUrl = "html_url"
    }
}

struct GitRepositories: Decodable {
    var request: [GitRepo]
}

struct MockData {
    static let sampleRepo = GitRepo(id: 71235,
                                    name: "Akubra",
                                    repositoryDescription: "Simple solution to keep a independent S3 storages in sync",
                                    language: "Go",
                                    stargazersCount: 80,
                                    htmlUrl: "https://github.com/allegro/akubra")
    
    
    static let repos = Array(repeating: sampleRepo, count: 5)
}
