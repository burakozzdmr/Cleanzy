//
//  BaseRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import UIKit

class BaseRouter {
    weak var viewController: UIViewController?
}

extension BaseRouter: BaseRouterProtocol {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        self.viewController?.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        self.viewController?.navigationController?.popToRootViewController(animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.viewController?.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        self.viewController?.dismiss(animated: animated, completion: completion)
    }
}
