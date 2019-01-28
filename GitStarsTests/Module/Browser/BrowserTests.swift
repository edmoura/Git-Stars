//
//  BrowserTests.swift
//  GitStarsTests
//
//  Created by Edson iMAC on 28/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Viperit
@testable import GitStars

class BrowserTests: QuickSpec {
    override func spec() {
        var view: BrowserMockView?
        var presenter: BrowserPresenter?
        
        beforeEach {
            var mod = AppModules.Browser.build()
            view = BrowserMockView()
            presenter = mod.presenter as? BrowserPresenter
            mod.injectMock(view: view!)
        }
        
        describe("BrowserTests") {
            context("AppModules"){
                it("check module build correct components") {
                    expect(presenter?._view).toEventually(beAnInstanceOf(BrowserMockView.self))
                    expect(presenter).toEventually(beAnInstanceOf(BrowserPresenter.self))
                    expect(presenter?._interactor).toEventually(beAnInstanceOf(BrowserInteractor.self))
                    expect(presenter?._router).toEventually(beAnInstanceOf(BrowserRouter.self))
                }
            }
        }
        
        describe("BrowserPresenter") {
            context("when BrowserPresenter is initialized") {
                beforeEach {
                    presenter?.viewHasLoaded()
                    presenter?.viewIsAboutToAppear()
                    presenter?.viewIsAboutToDisappear()
                }
                it("verify default var values"){
                    expect(presenter?.feed).to(beNil())
                }
            }
        }
        
    }
}

