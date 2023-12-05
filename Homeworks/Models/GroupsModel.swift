//
//  GroupsModel.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 04.12.2023.
//

import UIKit

struct GroupsModel: Decodable {
    var response: Groups
}
struct Groups: Decodable {
    var items: [Group]
}
struct Group: Codable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_50"
        case description
    }
}
