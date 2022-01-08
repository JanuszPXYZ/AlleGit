//
//  RepoCell.swift
//  GitRepos
//
//  Created by Janusz Polowczyk on 05/01/2022.
//

import SwiftUI

struct RepoCell: View {
    let repository: GitRepo
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(repository.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("allegroColor"))
                Spacer()
                Image(systemName: "chevron.forward.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            Text(repository.repositoryDescription ?? "")
                .font(.caption)
                .foregroundColor(.secondary)
            HStack(alignment: .center) {
                Text(repository.language ?? "")
                    .bold()
                Spacer()
                Text("\(repository.stargazersCount)")
                Image(systemName: "star.fill")
            }
        }
        .padding()
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(20.0)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct RepoCell_Previews: PreviewProvider {
    static var previews: some View {
        RepoCell(repository: MockData.sampleRepo)
    }
}
