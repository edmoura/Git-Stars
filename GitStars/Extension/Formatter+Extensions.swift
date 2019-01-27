//
//  Formatter+Extensions.swift
//  GitStars
//
//  Created by Edson iMAC on 27/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
