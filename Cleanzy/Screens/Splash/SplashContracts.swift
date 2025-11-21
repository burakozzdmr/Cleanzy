//
//  SplashContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

protocol SplashViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: SplashPresenterProtocol! { get set }
}

protocol SplashInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: SplashInteractorOutputProtocol? { get set }
}

protocol SplashInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol SplashPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorInputProtocol? { get set }
    var router: SplashRouterProtocol? { get set }
}

protocol SplashRouterProtocol: BaseRouterProtocol, AnyObject {
    var presenter: SplashPresenterProtocol? { get set }
    func splashToLogin()
}

protocol SplashBuilderProtocol: BaseBuilderProtocol, AnyObject { }
