//
//  SplashPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import Foundation

final class SplashPresenter {
    weak var view: SplashViewProtocol?
    var interactor: SplashInteractorInputProtocol?
    var router: SplashRouterProtocol?
}

extension SplashPresenter: SplashPresenterProtocol {
    func viewDidLoad() {
        router?.splashToLogin()
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    
}
