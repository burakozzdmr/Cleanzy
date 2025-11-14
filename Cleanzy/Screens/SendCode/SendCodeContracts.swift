//
//  SendCodeContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import Foundation

protocol SendCodeViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: SendCodePresenter! { get set }
}

protocol SendCodeInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: SendCodePresenter? { get set }
}

protocol SendCodeInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol SendCodePresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: SendCodeViewController? { get set }
    var interactor: SendCodeInteractor? { get set }
    var router: SendCodeRouter? { get set }
    
    func didLoginTapped()
}

protocol SendCodeRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: SendCodeViewController? { get set }
    
    func sendCodeToLoginScreen()
}

protocol SendCodeBuilderProtocol: BaseBuilderProtocol, AnyObject { }
