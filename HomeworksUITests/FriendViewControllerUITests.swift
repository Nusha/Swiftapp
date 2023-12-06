//
//  FriendViewControllerUITests.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 06.12.2023.
//

import XCTest

class FriendViewControllerUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUp() {
      super.setUp()
      app = XCUIApplication()
      app.launchArguments = ["testing"]
      app.launch()
  }

  func testTransitionToProfileViewController() {
      let tableView = app.tables.firstMatch
      XCTAssertTrue(tableView.exists)

      let profileViewController = app.navigationBars["Profile"].firstMatch
      XCTAssertFalse(profileViewController.exists)

      tableView.cells.firstMatch.tap()

      XCTAssertTrue(profileViewController.exists)
  }
}
