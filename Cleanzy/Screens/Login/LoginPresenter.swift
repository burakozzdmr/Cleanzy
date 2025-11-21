//
//  LoginPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

final class LoginPresenter {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var router: LoginRouterProtocol?
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func didLoginTapped(with email: String, and password: String, as userTypeIndex: Int) {
        view?.showLoading()
        interactor?.sendLoginRequest(with: email, and: password, as: userTypeIndex)
    }
    
    func didForgotPasswordTapped() {
        router?.loginToForgotPasswordScreen()
    }
    
    func didRegisterTapped() {
        router?.loginToRegisterScreen()
    }
}

// MARK: - LoginInteractorOutputProtocol

extension LoginPresenter: LoginInteractorOutputProtocol {
    func didLoginSuccess() {
        view?.hideLoading()
        router?.loginToHomeScreen()
    }
    
    func didLoginFailure() {
        view?.hideLoading()
        view?.showAlert(
            with: .init(
                title: "HATA",
                message: "Login Failed"
            )
        )
    }
}
