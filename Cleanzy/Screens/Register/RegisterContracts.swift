//
//  RegisterContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

protocol RegisterViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: RegisterPresenter! { get set }
}

protocol RegisterInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: RegisterPresenter? { get set }
    
    func sendRegisterRequest(with email: String, and password: String)
}

protocol RegisterInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject {
    func didRegisterSuccess()
    func didRegisterFailure()
}

protocol RegisterPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: RegisterViewController? { get set }
    var interactor: RegisterInteractor? { get set }
    var router: RegisterRouter? { get set }
    
    func didRegisterTapped(with email: String, and password: String)
}

protocol RegisterRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: RegisterViewController? { get set }
    
    func registerToPrepareContentScreen()
}

protocol RegisterBuilderProtocol: BaseBuilderProtocol, AnyObject { }
