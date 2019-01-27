//
//  BrowserView.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
import WebKit

//MARK: BrowserView Class
final class BrowserView: UserInterface {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var navTitle: UILabel!
    
    @IBAction func buttonClose(_ sender: Any) {
        presenter.buttonClose()
    }
}

//MARK: - BrowserView API
extension BrowserView: BrowserViewApi {
    func configWebView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.webView.navigationDelegate = self
        self.progressView.alpha = 0
        self.navTitle.alpha = 0
    }
    
    func webViewLoadRequest(url: String?) {
        let _url = URL(string: url ?? "")
        let request = URLRequest(url: _url!)
        webView.load(request)
    }
    
    func addObserver() {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
    }
    
    func removeObserver() {
        webView.removeObserver(self, forKeyPath: "title")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    func showProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 1
        }, completion: nil)
    }
    
    func hideProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 0
        }, completion: nil)
    }
    
    func setProgressView(float: Float) {
        progressView.progress = float;
    }
    
    func setTitleView(title: String) {
        self.navTitle.text = title
        if self.navTitle.alpha == 0 {
            UIView.animate(withDuration: 0.5) {
                self.navTitle.alpha = 1
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        return presenter.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    }
    
}

extension BrowserView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        return presenter.webView(webView, didFinish: navigation)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        return presenter.webView(webView, didStartProvisionalNavigation: navigation)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        return presenter.webView(webView, didFail: navigation, withError: error)
    }
}

// MARK: - BrowserView Viper Components API
private extension BrowserView {
    var presenter: BrowserPresenterApi {
        return _presenter as! BrowserPresenterApi
    }
    var displayData: BrowserDisplayData {
        return _displayData as! BrowserDisplayData
    }
}
