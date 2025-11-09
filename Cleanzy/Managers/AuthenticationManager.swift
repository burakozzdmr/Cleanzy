//
//  AuthenticationManager.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 9.11.2025.
//

import Combine
import FirebaseAuth
import FirebaseAuthCombineSwift
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

protocol AuthenticationManagerProtocol: AnyObject {
    func signIn(with email: String, and password: String) -> AnyPublisher<AuthDataResult, Error>
    func signUp(with email: String, and password: String) -> AnyPublisher<AuthDataResult, Error>
    func signOut() -> AnyPublisher<Void, Error>
}

// MARK: - AuthenticationManager

class AuthenticationManager {
    private let firebaseAuthentication = Auth.auth()
    private let firebaseFirestore = Firestore.firestore()
    
    var currentUser: User? {
        firebaseAuthentication.currentUser
    }
}

// MARK: - AuthenticationManagerProtocol

extension AuthenticationManager: AuthenticationManagerProtocol {
    
    func signIn(with email: String, and password: String) -> AnyPublisher<AuthDataResult, Error> {
        return firebaseAuthentication
            .signIn(withEmail: email, password: password)
            .eraseToAnyPublisher()
    }
    
    func signUp(with email: String, and password: String) -> AnyPublisher<AuthDataResult, Error> {
        return firebaseAuthentication
            .createUser(withEmail: email, password: password)
            .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { [weak self] promise in
            do {
                try self?.firebaseAuthentication.signOut()
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
