//
//  RepositoryListViewModel.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 06/01/2022.
//

import SwiftUI

final class RepositoryListViewModel: ObservableObject {
    @Published var gitRepos: [GitRepo] = []
    
    func downloadRepos() {
        NetworkManager.shared.getRepos { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let gitRepos):
                    self.gitRepos = gitRepos
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

}
