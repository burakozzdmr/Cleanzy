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
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol LoginPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: LoginViewController? { get set }
    var interactor: LoginInteractor? { get set }
    var router: LoginRouter? { get set }
}

protocol LoginRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: LoginViewController? { get set }
}

protocol LoginBuilderProtocol: BaseBuilderProtocol, AnyObject { }
