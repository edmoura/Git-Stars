//
//  IndexInteractorMockView.swift
//  GitStarsTests
//
//  Created by Edson iMAC on 28/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Viperit
import Moya
@testable import GitStars

class IndexInteractorMockView: Interactor, IndexInteractorApi {
    
    let stubbingProvider = MoyaProvider<Service>(stubClosure: MoyaProvider.immediatelyStub)
    var request: Cancellable?
    
    func getList(language: String, sort: String, page: Int, per_page: Int, callback: @escaping (Result<Repositories>) -> Void) {
        request = stubbingProvider.request(.getList(language: language, sort: sort, page: page, per_page: per_page)) { (result) in
            switch result {
            case let .success(moyaResponse):
                if let repo: Repositories = try? JSONDecoder().decode(Repositories.self, from: moyaResponse.data) {
                    callback(.success(repo))
                } else {
                    callback(.failure(AppErrorHandler.jsonNotSerializable))
                }
            case let .failure(error):
                callback(.failure(error))
            }
        }
    }
    
    func cancelRequest() {
        request?.cancel()
    }
}
