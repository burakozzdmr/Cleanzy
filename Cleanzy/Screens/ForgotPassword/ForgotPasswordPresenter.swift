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
    func viewDidLoad() {
        didSendCodeSuccessfully()
    }
    
    func didSendCodeSuccessfully() {
        interactor?.sendCodeRequest()
    }
}

extension ForgotPasswordPresenter: ForgotPasswordInteractorOutputProtocol { }
