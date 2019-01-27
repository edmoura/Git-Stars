//
//  IndexInteractor.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Viperit
import Moya

// MARK: - IndexInteractor Class
final class IndexInteractor: Interactor {
    private let apiService = MoyaProvider<Service>()
    //private let apiService = MoyaProvider<Service>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private var request: Cancellable?
}

// MARK: - IndexInteractor API
extension IndexInteractor: IndexInteractorApi {
    func getList(language: String, sort: String, page: Int, per_page: Int, callback: @escaping (Result<Repositories>) -> Void) {
        request = apiService.request(.getList(language: language, sort: sort, page: page, per_page: per_page), completion: { (result) in
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
        })
    }
    
    func cancelRequest() {
        request?.cancel()
    }
}

// MARK: - Interactor Viper Components Api
private extension IndexInteractor {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
}
