//
//  ForgotPasswordContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

protocol ForgotPasswordViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: ForgotPasswordPresenterProtocol! { get set }
}

protocol ForgotPasswordInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: ForgotPasswordInteractorOutputProtocol? { get set }
    
    func sendCodeRequest(for emailText: String)
}

protocol ForgotPasswordInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject {
    func didSendPasswordSuccess()
    func didSendPasswordFailure(with errorMessage: String)
}

protocol ForgotPasswordPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: ForgotPasswordViewProtocol? { get set }
    var interactor: ForgotPasswordInteractorInputProtocol? { get set }
    var router: ForgotPasswordRouterProtocol? { get set }
    
    func didSendPasswordLinkTapped(with email: String)
}

protocol ForgotPasswordRouterProtocol: BaseRouterProtocol, AnyObject {
    var presenter: ForgotPasswordPresenterProtocol? { get set }
    
    func forgotPasswordToSendCodeScreen()
}

protocol ForgotPasswordBuilderProtocol: BaseBuilderProtocol, AnyObject { }
