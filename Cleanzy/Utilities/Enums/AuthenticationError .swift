//
//  AuthenticationError .swift
//  Cleanzy
//
//  Created by Burak Özdemir on 11.11.2025.
//

import Foundation

enum AuthenticationError: Error {
    case invalidEmail
    case invalidPassword
    case userNotFound
    case userAlreadyExists
    case decodingError
    case firebaseError(Error)
    
    var errorMessage: String {
        switch self {
        case .invalidEmail:
            return "Invalid email"
        case .invalidPassword:
            return "Invalid password"
        case .userNotFound:
            return "User not found"
        case .userAlreadyExists:
            return "User already exists"
        case .decodingError:
            return "Decoding error"
        case .firebaseError(let error):
            return error.localizedDescription
        }
    }
}
