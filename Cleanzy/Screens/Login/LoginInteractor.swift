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
                    print("Sign In process is successfully completed")
                case .failure:
                    self?.presenter?.didLoginFailure()
                }
            } receiveValue: { [weak self] _ in
                self?.presenter?.didLoginSuccess()
            }
            .store(in: &cancellables)
    }
}
