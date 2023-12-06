//
//  FileCacheTests.swift
//  HomeworksTests
//
//  Created by Иван  Балабай  on 06.12.2023.
//

import XCTest
@testable import Homeworks

class FileCacheTests: XCTestCase {
  var sut: FileCacheProtocol!
  
  override func setUp() {
      super.setUp()
      sut = FileCache()
  }
  
  override func tearDown() {
      sut = nil
      super.tearDown()
  }
  
  func testAddFriends() {
      let friend1 = Friend(id: 1, firstName: "John", lastName: "Doe", photo: "url_to_photo", online: 1)
      let friend2 = Friend(id: 2, firstName: "Jane", lastName: "Doe", photo: "url_to_photo", online: 1)
      let friends = [friend1, friend2]
      
      sut.addFriends(friends: friends)
      
      let fetchedFriends = sut.fetchFriends()
      
      XCTAssertFalse(isEqual(fetchedFriends, friends))
  }
    func isEqual(_ lhs: [Friend], _ rhs: [Friend]) -> Bool {
       guard lhs.count == rhs.count else {
           return false
       }
       
       for i in 0..<lhs.count {
           if lhs[i].id != rhs[i].id ||
              lhs[i].firstName != rhs[i].firstName ||
              lhs[i].lastName != rhs[i].lastName ||
              lhs[i].photo != rhs[i].photo ||
              lhs[i].online != rhs[i].online {
               return false
           }
       }
       return true
    }
}
