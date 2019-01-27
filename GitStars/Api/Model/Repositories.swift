//
//  Repositories.swift
//  GitStars
//
//  Created by Edson iMAC on 27/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [Items]?
}
