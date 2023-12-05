//
// NetworkServiceMock.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 06.12.2023.
//

import Foundation
@testable import Homeworks

final class NetworkServiceMock: NetworkServiceProtocol {
    private(set) var isGetFriendsWasCalled = false
    
    func getFriends(completion: @escaping (Result<[Homeworks.Friend], Error>) -> Void) {
        isGetFriendsWasCalled = true
    }
}
