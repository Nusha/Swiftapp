//
//  FriendCellTests.swift
//  HomeworksTests
//
//  Created by Иван  Балабай  on 06.12.2023.
//

import XCTest
@testable import Homeworks

class FriendCellTests: XCTestCase {
   var sut: FriendCell!
   
   override func setUp() {
       super.setUp()
       sut = FriendCell(style: .default, reuseIdentifier: "FriendCell")
   }
   
   override func tearDown() {
       sut = nil
       super.tearDown()
   }
   
   func testUpdateCell() {
       let friend = Friend(id: 1, firstName: "John", lastName: "Doe", photo: "url_to_photo", online: 1)
       
       sut.updateCell(model: friend)
       
       XCTAssertNotNil(sut.textLabel)
       XCTAssertEqual(sut._onlineCircle.backgroundColor, .green)
   }
}
