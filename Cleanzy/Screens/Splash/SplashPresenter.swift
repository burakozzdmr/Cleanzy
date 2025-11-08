//
//  SplashPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import Foundation

class SplashPresenter {
    var view: SplashViewController?
    var interactor: SplashInteractor?
    var router: SplashRouter?
}

extension SplashPresenter: SplashPresenterProtocol {
    func viewDidLoad() {
        router?.splashToLogin()
    }
}

extension SplashPresenter: SplashInteractorInputProtocol { }
