//
//  RegisterInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

class RegisterInteractor {
    weak var presenter: RegisterPresenter?
}

// MARK: - RegisterInteractorInputProtocol

extension RegisterInteractor: RegisterInteractorInputProtocol { }
