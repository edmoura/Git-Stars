//
//  Items.swift
//  GitStars
//
//  Created by Edson iMAC on 26/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

struct Items: Codable {
    let id: Int?
    let node_id: String?
    let name: String?
    let full_name: String?
    let owner: Owner?
    let html_url: String?
    let description: String?
    let url: String?
    let created_at: String?
    let updated_at: String?
    let stargazers_count: Int?
    let watchers_count: Int?
    let language: String?
    let license: License?
    let watchers: Int?
    let _private: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case node_id
        case name
        case full_name
        case owner
        case html_url
        case description
        case url
        case created_at
        case updated_at
        case stargazers_count
        case watchers_count
        case language
        case license
        case watchers
        case _private = "private"
    }
}
