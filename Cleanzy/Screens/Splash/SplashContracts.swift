//
//  SplashContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

// MARK: - SplashViewProtocol

protocol SplashViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: SplashPresenterProtocol! { get set }
}

// MARK: - SplashInteractorInputProtocol

protocol SplashInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: SplashInteractorOutputProtocol? { get set }
}

// MARK: - SplashInteractorOutputProtocol

protocol SplashInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

// MARK: - SplashPresenterProtocol

protocol SplashPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorInputProtocol? { get set }
    var router: SplashRouterProtocol? { get set }
}

// MARK: - SplashRouterProtocol

protocol SplashRouterProtocol: BaseRouterProtocol, AnyObject {
    var presenter: SplashPresenterProtocol? { get set }
    func splashToLogin()
}

// MARK: - SplashBuilderProtocol

protocol SplashBuilderProtocol: BaseBuilderProtocol, AnyObject { }
