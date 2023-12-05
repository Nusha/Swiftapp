//
//  UserModel.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 04.12.2023.
//

import UIKit

struct UserModel: Decodable {
    var response: [User]
}
struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_400_orig"
    }
}
