//
//  ClientId.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 04.12.2023.
//

import UIKit

enum Credentials {
    case clientID
    
    var value: String {
        switch self {
        case .clientID:
            return "51807895"
        }
    }
}
