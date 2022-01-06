//
//  RepositoryDetailView.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 06/01/2022.
//

// TODO: Add a safari extension that will allow the user to visit the git repository in Safari - Done

import SwiftUI

struct RepositoryDetailView: View {
    var repo: GitRepo
    @State private var isShowingSafariView = false
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(repo.name)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding()
                Divider()
                
                HStack {
                    Text("Description:")
                        .font(.body)
                        .bold()
                        .padding()
                    Text(repo.repositoryDescription ?? "None")
                        .padding(.trailing, 10)
                }
                
                Divider()
                
                HStack {
                    Text("Language:")
                        .font(.body)
                        .bold()
                        .padding()
                    Text(repo.language ?? "None")
                        .padding()
                }
                
                Divider()
                
                HStack {
                    Text("Stargazers Count:")
                        .font(.body)
                        .bold()
                        .padding()
                        .frame(width: 120)
                    
                    Text("\(repo.stargazersCount)")
                        .padding()
                }
                
                Divider()
                Spacer()
                //            HStack(alignment: .center) {
                //                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                //                    Text("See Repo in Safari")
                //                        .font(.system(size: 20, weight: .bold, design: .rounded))
                //                        .foregroundColor(.white)
                //                })
                //            }
                //            .frame(width: 250, height: 50)
                //            .background(Color.blue)
                //            .cornerRadius(10.0)
                
            }
            HStack {
                Button(action: {
                    isShowingSafariView = true
                }, label: {
                    Text("See Repo in Safari")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                })
                .sheet(isPresented: $isShowingSafariView) {
                    SafariView(url: URL(string: repo.htmlUrl) ?? URL(string: "https://github.com")!)
                }

            }
            .frame(width: 250, height: 50)
            .background(Color.blue)
            .cornerRadius(10.0)
        }
        .padding(.bottom, 50)
        
    }
    
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(repo: MockData.sampleRepo)
    }
}
