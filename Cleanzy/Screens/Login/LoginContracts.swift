//
//  LoginContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

protocol LoginViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: LoginPresenter! { get set }
}

protocol LoginInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: LoginPresenter? { get set }
    
    func sendLoginRequest(with email: String, and password: String, as userTypeIndex: Int)
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject {
    func didLoginSuccess()
    func didLoginFailure()
}

protocol LoginPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: LoginViewController? { get set }
    var interactor: LoginInteractor? { get set }
    var router: LoginRouter? { get set }
    
    func didLoginTapped(with email: String, and password: String, as userTypeIndex: Int)
    func didForgotPasswordTapped()
    func didRegisterTapped()
}

protocol LoginRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: LoginViewController? { get set }
    
    func loginToHomeScreen()
    func loginToForgotPasswordScreen()
    func loginToRegisterScreen()
}

protocol LoginBuilderProtocol: BaseBuilderProtocol, AnyObject { }
