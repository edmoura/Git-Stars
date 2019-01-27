//
//  BrowserPresenter.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Foundation
import Viperit
import WebKit

// MARK: - BrowserPresenter Class
final class BrowserPresenter: Presenter {
    
    var feed: Items?
    
    override func viewHasLoaded() {
        startContent()
    }
    
    override func viewIsAboutToAppear() {
        view.addObserver()
        view.webViewLoadRequest(url: feed?.html_url)
    }
    
    override func viewIsAboutToDisappear() {
        view.removeObserver()
    }
    
    override func setupView(data: Any) {
        feed = data as? Items
    }
}

// MARK: - BrowserPresenter API
extension BrowserPresenter: BrowserPresenterApi {
    func startContent() {
        view.configWebView()
    }
    
    func buttonClose() {
        router.dismissViewControllerAnimated()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        view.hideProgressView()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        view.showProgressView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        view.hideProgressView()
    }
    
    func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if let progress = (change?[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                view.setProgressView(float: progress)
            }
            return
        }
        if keyPath == "title" {
            if let title = change?[NSKeyValueChangeKey.newKey] as? String {
               view.setTitleView(title: title)
            }
            return
        }
    }
}

// MARK: - Browser Viper Components
private extension BrowserPresenter {
    var view: BrowserViewApi {
        return _view as! BrowserViewApi
    }
    var interactor: BrowserInteractorApi {
        return _interactor as! BrowserInteractorApi
    }
    var router: BrowserRouterApi {
        return _router as! BrowserRouterApi
    }
}
