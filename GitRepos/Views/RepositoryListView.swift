//
//  RepositoryListView.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 05/01/2022.
//

// TODO: Change the name of the ContentView to RepositoryListView - done
// TODO: Refactor into MVVM - done
// TODO: Pass the data to the detail screen - done

import SwiftUI

struct RepositoryListView: View {
    
    @StateObject var viewModel = RepositoryListViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(viewModel.gitRepos) { repo in
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
            viewModel.downloadRepos()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
