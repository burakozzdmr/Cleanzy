//
//  ForgotPasswordContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

protocol ForgotPasswordViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: ForgotPasswordPresenter! { get set }
}

protocol ForgotPasswordInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: ForgotPasswordPresenter? { get set }
    
    func sendCodeRequest(for emailText: String)
}

protocol ForgotPasswordInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol ForgotPasswordPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: ForgotPasswordViewController? { get set }
    var interactor: ForgotPasswordInteractor? { get set }
    var router: ForgotPasswordRouter? { get set }
    
    func didSendPasswordLinkTapped(with email: String)
    func didSendPasswordSuccess()
    func didSendPasswordFailure(with errorMessage: String)
}

protocol ForgotPasswordRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: ForgotPasswordViewController? { get set }
    
    func forgotPasswordToSendCodeScreen()
}

protocol ForgotPasswordBuilderProtocol: BaseBuilderProtocol, AnyObject { }
