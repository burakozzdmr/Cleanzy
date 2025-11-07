//
//  BaseContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject { }

protocol BaseInteractorInputProtocol: AnyObject { }

protocol BaseInteractorOutputProtocol: AnyObject { }

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

protocol BaseBuilderProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol BaseRouterProtocol: AnyObject {
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
