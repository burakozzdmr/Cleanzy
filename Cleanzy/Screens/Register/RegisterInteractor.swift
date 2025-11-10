//
//  RegisterInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Combine
import Foundation

class RegisterInteractor {
    weak var presenter: RegisterPresenter?
    private let authenticationManager: AuthenticationManagerProtocol
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
}

// MARK: - RegisterInteractorInputProtocol

extension RegisterInteractor: RegisterInteractorInputProtocol {
    func sendRegisterRequest(with email: String, and password: String) {
        authenticationManager.signUp(with: email, and: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.presenter?.didRegisterSuccess()
                case .failure:
                    self?.presenter?.didRegisterFailure()
                }
            } receiveValue: { authData in
                print("USER DATA -> \(authData)")
            }
            .store(in: &cancellables)
    }
}
