//
//  PrepareContentRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

// MARK: - PrepareContentRouter

final class PrepareContentRouter {
    weak var presenter: PrepareContentPresenterProtocol?
}

// MARK: - PrepareContentRouterProtocol

extension PrepareContentRouter: PrepareContentRouterProtocol {
    func prepareContentToHomeScreen() {
        //TODO: PREPARE CONTENT TO HOME SCREEN TRANSITION LOGIC
    }
}
