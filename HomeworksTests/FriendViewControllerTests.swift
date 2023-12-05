import XCTest
@testable import Homeworks
final class FriendsControllerTests: XCTestCase {
    private var friendsController: FriendViewController!
    private var networkService: NetworkServiceMock!
    private var fileCache: FileCacheMock!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkServiceMock()
        fileCache = FileCacheMock()
        friendsController = FriendViewController(networkService: networkService!, models: [], fileCache: fileCache!)
    }
    
    override func tearDown() {
        friendsController = nil
        networkService = nil
        fileCache = nil
        super.tearDown()
    }
     
    func testGetFriends() {
        friendsController.getFriends()
        XCTAssertTrue(networkService.isGetFriendsWasCalled, "failure")
    }
    
}
