//
//  ForgotPasswordInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Combine
import Foundation

final class ForgotPasswordInteractor {
    weak var presenter: ForgotPasswordInteractorOutputProtocol?
    private let authenticationManager: AuthenticationManagerProtocol
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
}

extension ForgotPasswordInteractor: ForgotPasswordInteractorInputProtocol {
    func sendCodeRequest(for emailText: String) {
        authenticationManager.sendResetPasswordLink(with: emailText)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.presenter?.didSendPasswordSuccess()
                case .failure(let error):
                    self?.presenter?.didSendPasswordFailure(with: error.localizedDescription)
                }
            } receiveValue: { }
            .store(in: &cancellables)
    }
}
