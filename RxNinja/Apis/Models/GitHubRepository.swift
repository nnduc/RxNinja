//
//  GitHubRepository.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/8/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import Foundation

struct GitHubRepository: Decodable {
    let id: Int
    let fullName: String
    let description: String
    let stargazersCount: Int
    let url: URL

    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case url = "html_url"
    }

}

struct SearchRepositoriesResponse: Decodable {
    let items: [GitHubRepository]
}
