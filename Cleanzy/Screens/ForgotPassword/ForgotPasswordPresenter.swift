//
//  ForgotPasswordPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

class ForgotPasswordPresenter {
    weak var view: ForgotPasswordViewController?
    var interactor: ForgotPasswordInteractor?
    var router: ForgotPasswordRouter?
}

extension ForgotPasswordPresenter: ForgotPasswordPresenterProtocol {
    func didSendPasswordLinkTapped(with email: String) {
        view?.showLoading()
        interactor?.sendCodeRequest(for: email)
    }
    
    func didSendPasswordSuccess() {
        view?.hideLoading()
        router?.forgotPasswordToSendCodeScreen()
    }
    
    func didSendPasswordFailure(with errorMessage: String) {
        view?.hideLoading()
        view?.showAlert(with: errorMessage)
    }
}

extension ForgotPasswordPresenter: ForgotPasswordInteractorOutputProtocol { }
