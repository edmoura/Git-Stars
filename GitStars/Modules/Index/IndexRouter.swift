//
//  IndexRouter.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Viperit

// MARK: - IndexRouter class
final class IndexRouter: Router {
}

// MARK: - IndexRouter API
extension IndexRouter: IndexRouterApi {
    func showWebView(item: Items?) {
        let module = AppModules.Browser.build()
        module.router.show(from: _view, embedInNavController: true, setupData: item)
    }
    
}

// MARK: - Index Viper Components
private extension IndexRouter {
    var presenter: IndexPresenterApi {
        return _presenter as! IndexPresenterApi
    }
}
