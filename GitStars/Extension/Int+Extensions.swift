//
//  Int+Extensions.swift
//  GitStars
//
//  Created by Edson iMAC on 27/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
