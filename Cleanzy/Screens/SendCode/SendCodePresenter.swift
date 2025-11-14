//
//  SendCodePresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import Foundation

class SendCodePresenter {
    weak var view: SendCodeViewController?
    var interactor: SendCodeInteractor?
    var router: SendCodeRouter?
}

extension SendCodePresenter: SendCodePresenterProtocol {
    func didLoginTapped() {
        router?.sendCodeToLoginScreen()
    }
}

extension SendCodePresenter: SendCodeInteractorOutputProtocol { }
