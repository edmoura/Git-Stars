//
//  BrowserMockView.swift
//  GitStarsTests
//
//  Created by Edson iMAC on 28/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation
import Viperit
@testable import GitStars

class BrowserMockView: UserInterface, BrowserViewApi {
    func showProgressView() {}
    func hideProgressView() {}
    func setProgressView(float: Float) {}
    func setTitleView(title: String) {}
    func configWebView() {}
    func addObserver() {}
    func removeObserver() {}
    func webViewLoadRequest(url: String?) {}
}
