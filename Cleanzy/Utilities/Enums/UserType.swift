//
//  UserType.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 11.11.2025.
//

import Foundation

enum UserType: Int, Codable {
    case customer
    case cleaner
    
    init(for userTypeIndex: Int) {
        switch userTypeIndex {
        case 0:
            self = .customer
        default:
            self = .cleaner
        }
    }
}
