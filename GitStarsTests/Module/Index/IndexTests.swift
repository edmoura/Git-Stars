//
//  IndexTests.swift
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

class IndexTests: QuickSpec {
    override func spec() {
        
        var view: IndexMockView?
        var presenter: IndexPresenter?
        var interactor: IndexInteractorMockView?
        
        beforeEach {
            var mod = AppModules.Index.build()
            view = IndexMockView()
            presenter = mod.presenter as? IndexPresenter
            interactor = IndexInteractorMockView()
            mod.injectMock(interactor: interactor!)
            mod.injectMock(view: view!)
        }
        
        describe("IndexTests") {
            context("AppModules"){
                it("check module build correct components") {
                    expect(presenter?._view).toEventually(beAnInstanceOf(IndexMockView.self))
                    expect(presenter).toEventually(beAnInstanceOf(IndexPresenter.self))
                    expect(presenter?._interactor).toEventually(beAnInstanceOf(IndexInteractorMockView.self))
                    expect(presenter?._router).toEventually(beAnInstanceOf(IndexRouter.self))
                }
            }
        }
        
        describe("IndexPresenter") {
            context("when IndexPresenter is initialized") {
                it("verify default var values") {
                    expect(presenter?.per_page) >= 10
                    expect(presenter?.isFetching) == false
                    expect(presenter?.isLoading) == true
                    expect(presenter?.currentPage) == 1
                    expect(presenter?.list.count) >= 0
                    
                }
            }
            
            context("when IndexPresenter call viewHasLoaded") {
                beforeEach {
                    presenter?.viewHasLoaded()
                }
                it("verify default var values") {
                    expect(presenter?.per_page) >= 10
                    expect(presenter?.isFetching) == false
                    expect(presenter?.isLoading) == false
                    expect(presenter?.currentPage) == 1
                    expect(presenter?.list.count) >= 10
                }
            }
            
            context("when IndexPresenter call refreshData") {
                beforeEach {
                    presenter?.refreshData()
                }
                it("verify refresh data list < per_page") {
                    expect(presenter?.isFetching) == false
                    expect(presenter?.isLoading) == true
                    expect(presenter?.currentPage) == 1
                    expect(presenter?.list.count) >= 0
                }
            }
            
            context("when IndexPresenter call stubbedResponse") {
                beforeEach {
                    interactor?.getList(language: "swift", sort: "stars", page: presenter?.currentPage ?? 1, per_page: presenter?.per_page ?? 10) { (result) in
                        switch result {
                        case .success(let data):
                            if data.items?.isEmpty == false {
                                for repo in data.items ?? [] {
                                    presenter?.list.append(repo)
                                }
                            }
                        case .failure( _): break
                        }
                    }
                }
                it("verify list is InstanceOf Array<Items>") {
                    expect(presenter?.list).toEventually(beAnInstanceOf(Array<Items>.self))
                }
            }
            
        }
    }
}
