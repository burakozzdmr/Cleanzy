//
//  LoginInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Combine
import Foundation

class LoginInteractor {
    weak var presenter: LoginPresenter?
    private let authenticationManager: AuthenticationManagerProtocol
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
}

// MARK: - LoginInteractorInputProtocol

extension LoginInteractor: LoginInteractorInputProtocol {
    func sendLoginRequest(with email: String, and password: String) {
        authenticationManager.signIn(with: email, and: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.presenter?.didLoginSuccess()
                case .failure:
                    self?.presenter?.didLoginFailure()
                }
            } receiveValue: { authData in
                print("USER DATA -> \(authData)")
            }
            .store(in: &cancellables)
    }
}
