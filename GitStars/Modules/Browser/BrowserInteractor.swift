//
//  BrowserInteractor.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - BrowserInteractor Class
final class BrowserInteractor: Interactor {
}

// MARK: - BrowserInteractor API
extension BrowserInteractor: BrowserInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension BrowserInteractor {
    var presenter: BrowserPresenterApi {
        return _presenter as! BrowserPresenterApi
    }
}
