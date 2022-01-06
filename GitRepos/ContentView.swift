//
//  RepositoryListView.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 05/01/2022.
//

// TODO: Change the name of the ContentView to RepositoryListView
// TODO: Refactor into MVVM
// TODO: Pass the data to the detail screen - in progress
// TODO: Clean up the code

import SwiftUI

struct RepositoryListView: View {
//    var repositories = MockData.repos
    @State var gitRepos: [GitRepo] = []
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(gitRepos) { repo in
                            NavigationLink(
                                destination: RepositoryDetailView(repo: repo),
                                label: {
                                    RepoCell(repository: repo)
                                        .foregroundColor(.black)
                                })
                        }
                        .padding()
                    }
                }
                .frame(width: geometry.frame(in: .global).width)
            }
            .navigationTitle("Allegro")
        }
        .onAppear {
            downloadRepos()
        }
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
