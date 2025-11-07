//
//  BaseBuilder.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import UIKit

class BaseBuilder: BaseBuilderProtocol {
    static func createModule() -> UIViewController {
        let viewController = BaseViewController()
        let presenter = BasePresenter()
        let interactor = BaseInteractor()
        let router = BaseRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
