//
//  GitStarsUITests.swift
//  GitStarsUITests
//
//  Created by Edson iMAC on 25/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import XCTest

class GitStarsUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testArticleButton() {
        app.launch()
        
        let articleTableView = app.tables["table--listTableView"]
        XCTAssertTrue(articleTableView.exists, "tableView Articles Exists")
        
        let tableCells = articleTableView.cells
        
        if tableCells.count > 0 {
            
            let firstCell = tableCells.element(boundBy: 0)
            let firstCellExists = NSPredicate(format: "exists == true")
            expectation(for: firstCellExists, evaluatedWith: firstCell, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(firstCell.exists, "First cell is on the table")
            firstCell.tap()
            
            let closeArticleButton = app.buttons["button--closeArticleButton"]
            let labelWebViewTitle = app.staticTexts["label--webView"]
            var exists = NSPredicate(format: "exists == true")
            expectation(for: exists, evaluatedWith: labelWebViewTitle, handler: nil)
            XCTAssertTrue(true, "Web view loaded was successful")
            waitForExpectations(timeout: 20, handler: nil)
            closeArticleButton.tap()
            
            let tableBottom = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 1.0))
            let scrollVector = CGVector(dx: 0.0, dy: -2000.0)
            tableBottom.press(forDuration: 0.5, thenDragTo: tableBottom.withOffset(scrollVector))
            exists = NSPredicate(format: "exists == true")
            let lastCell = tableCells.element(boundBy: tableCells.count - 1)
            expectation(for: exists, evaluatedWith: lastCell, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(lastCell.exists, "Loading more cells ok")
            XCTAssertTrue(true, "Finished validating app")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }

}
