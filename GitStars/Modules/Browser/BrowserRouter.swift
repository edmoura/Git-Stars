//
//  BrowserRouter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - BrowserRouter class
final class BrowserRouter: Router {
}

// MARK: - BrowserRouter API
extension BrowserRouter: BrowserRouterApi {
    func dismissViewControllerAnimated() {
        _view.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Browser Viper Components
private extension BrowserRouter {
    var presenter: BrowserPresenterApi {
        return _presenter as! BrowserPresenterApi
    }
}
