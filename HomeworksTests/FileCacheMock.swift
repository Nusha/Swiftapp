//
//  FileCackeMock.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 06.12.2023.
//
import Foundation
@testable import Homeworks

final class FileCacheMock: FileCacheProtocol {
    private(set) var isAddFriendsWasCalled = false
    private(set) var isFetchFriendsWasCalled = false
    private(set) var isFetchFriendDateWasCalled = false
    private(set) var isAddFriendDateWasCalled = false
    func addFriends(friends: [Homeworks.Friend]) {
        isAddFriendsWasCalled = true
    }
    
    func fetchFriends() -> [Homeworks.Friend] {
        isFetchFriendsWasCalled = true
        return []
    }
    
    func fetchFriendDate() -> Date? {
        isFetchFriendDateWasCalled = true
        return nil
    }
    
    func addFriendDate() {
        isAddFriendDateWasCalled = true
    }
}
