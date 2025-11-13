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
    
    func sendCodeRequest()
}

protocol ForgotPasswordInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol ForgotPasswordPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: ForgotPasswordViewController? { get set }
    var interactor: ForgotPasswordInteractor? { get set }
    var router: ForgotPasswordRouter? { get set }
    
    func didSendCodeSuccessfully()
}

protocol ForgotPasswordRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: ForgotPasswordViewController? { get set }
    
    func forgotPasswordToSendCodeScreen()
}

protocol ForgotPasswordBuilderProtocol: BaseBuilderProtocol, AnyObject { }
