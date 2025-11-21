//
//  SendCodeContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import Foundation

protocol SendCodeViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: SendCodePresenterProtocol! { get set }
}

protocol SendCodeInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: SendCodeInteractorOutputProtocol? { get set }
}

protocol SendCodeInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol SendCodePresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: SendCodeViewProtocol? { get set }
    var interactor: SendCodeInteractorInputProtocol? { get set }
    var router: SendCodeRouterProtocol? { get set }
    
    func didLoginTapped()
}

protocol SendCodeRouterProtocol: BaseRouterProtocol, AnyObject {
    var presenter: SendCodePresenterProtocol? { get set }
    
    func sendCodeToLoginScreen()
}

protocol SendCodeBuilderProtocol: BaseBuilderProtocol, AnyObject { }
