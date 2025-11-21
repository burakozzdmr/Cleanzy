//
//  SendCodePresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import Foundation

final class SendCodePresenter {
    weak var view: SendCodeViewProtocol?
    var interactor: SendCodeInteractorInputProtocol?
    var router: SendCodeRouterProtocol?
}

extension SendCodePresenter: SendCodePresenterProtocol {
    func didLoginTapped() {
        router?.sendCodeToLoginScreen()
    }
}

extension SendCodePresenter: SendCodeInteractorOutputProtocol { }
