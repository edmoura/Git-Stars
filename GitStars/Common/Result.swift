//
//  Result.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
