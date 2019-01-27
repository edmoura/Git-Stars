//
//  BrowserModuleApi.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import Viperit
import WebKit

//MARK: - BrowserRouter API
protocol BrowserRouterApi: RouterProtocol {
    func dismissViewControllerAnimated()
}

//MARK: - BrowserView API
protocol BrowserViewApi: UserInterfaceProtocol {
    func configWebView()
    func addObserver()
    func removeObserver()
    func webViewLoadRequest(url: String?)
    func showProgressView()
    func hideProgressView()
    func setProgressView(float: Float)
    func setTitleView(title: String)
}

//MARK: - BrowserPresenter API
protocol BrowserPresenterApi: PresenterProtocol {
    func buttonClose()
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
}

//MARK: - BrowserInteractor API
protocol BrowserInteractorApi: InteractorProtocol {
}
