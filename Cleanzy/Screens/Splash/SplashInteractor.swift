//
//  SplashInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import Foundation

// MARK: - SplashInteractor

final class SplashInteractor {
    weak var presenter: SplashInteractorOutputProtocol?
}

// MARK: - SplashInteractorInputProtocol

extension SplashInteractor: SplashInteractorInputProtocol { }
