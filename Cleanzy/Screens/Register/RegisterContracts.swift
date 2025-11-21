//
//  RegisterContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

protocol RegisterViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: RegisterPresenterProtocol! { get set }
}

protocol RegisterInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: RegisterInteractorOutputProtocol? { get set }
    
    func sendRegisterRequest(with email: String, and password: String, as userTypeIndex: Int)
}

protocol RegisterInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject {
    func didRegisterSuccess()
    func didRegisterFailure()
}

protocol RegisterPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorInputProtocol? { get set }
    var router: RegisterRouterProtocol? { get set }
    
    func didRegisterTapped(with email: String, and password: String, as userTypeIndex: Int)
}

protocol RegisterRouterProtocol: BaseRouterProtocol, AnyObject {
    var presenter: RegisterPresenterProtocol? { get set }
    
    func registerToPrepareContentScreen()
}

protocol RegisterBuilderProtocol: BaseBuilderProtocol, AnyObject { }
