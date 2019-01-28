//
//  Service.swift
//  GitStars
//
//  Created by Edson iMAC on 26/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Moya

enum Service {
    case getList(language: String, sort: String, page: Int, per_page: Int)
}

extension Service: TargetType {
    var baseURL: URL {
        switch self {
        case .getList(_):
            return URL(string: "https://api.github.com/search/")!
        }
    }
    
    var path: String {
        switch self {
        case .getList(_):
            return "repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getList(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getList(_): return stubbedResponse("repositories")
        }
    }
    
    var task: Task {
        switch self {
        case .getList(let language, let sort, let page, let per_page):
            return .requestParameters(parameters: ["q": "language:\(language)", "sort": sort, "page": page, "per_page": per_page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject {}
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
