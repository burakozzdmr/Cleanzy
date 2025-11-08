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
}

protocol RegisterInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol RegisterPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: RegisterViewController? { get set }
    var interactor: RegisterInteractor? { get set }
    var router: RegisterRouter? { get set }
}

protocol RegisterRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: RegisterViewController? { get set }
}

protocol RegisterBuilderProtocol: BaseBuilderProtocol, AnyObject { }
