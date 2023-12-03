//
//  PhotosModel.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 04.12.2023.
//

import UIKit

struct PhotosModel: Decodable {
    var response: Photos
}
struct Photos: Decodable {
    var items: [Photo]
}
struct Photo: Decodable {
    var id: Int
    var text: String?
    var sizes: [Sizes]
}
struct Sizes: Codable {
    var url: String
}
