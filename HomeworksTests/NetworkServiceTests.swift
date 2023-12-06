import XCTest
@testable import Homeworks

class NetworkServiceTests: XCTestCase {
   var sut: NetworkServiceProtocol!
   
   override func setUp() {
       super.setUp()
       sut = NetworkService()
   }
   
   override func tearDown() {
       sut = nil
       super.tearDown()
   }
   
   func testGetFriendsFailure() {
       let expectation = self.expectation(description: "Network request failed")
       
       sut.getFriends { result in
           switch result {
           case .success:
               XCTFail("Expected failure, but received success")
           case .failure:
               expectation.fulfill()
           }
       }
       
       waitForExpectations(timeout: 5, handler: nil)
   }
}
