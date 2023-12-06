//
//  ViewControllerUITests.swift
//  HomeworksTests
//
//  Created by Иван  Балабай  on 06.12.2023.
//

import XCTest

final class ViewControllerUITests: XCTestCase {

    var app: XCUIApplication!

       override func setUp() {
           super.setUp()
//           XCUIApplication().launch()
           app = XCUIApplication()
           app.launchArguments = ["testing"]
           app.launch()
       }

       func testTransitionToTabBarController() {
           let webView = app.webViews.firstMatch
           XCTAssertTrue(webView.waitForExistence(timeout: 6))

           let tabBarController = app.tabBars.firstMatch
           XCTAssertFalse(tabBarController.exists)

           webView.tap()

           XCTAssertTrue(tabBarController.exists)
       }
    }
