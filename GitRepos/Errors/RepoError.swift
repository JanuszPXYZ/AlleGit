//
//  RepoError.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 05/01/2022.
//

import Foundation

enum RepoError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
