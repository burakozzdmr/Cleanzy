//
//  SplashContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

protocol SplashViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: SplashPresenter! { get set }
}

protocol SplashInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject { }

protocol SplashInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol SplashPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: SplashViewController? { get set }
    var interactor: SplashInteractor? { get set }
    var router: SplashRouter? { get set }
}

protocol SplashRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: SplashViewController? { get set }
}

protocol SplashBuilderProtocol: BaseBuilderProtocol, AnyObject { }
