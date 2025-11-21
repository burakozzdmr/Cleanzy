//
//  PrepareContentContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

protocol PrepareContentViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: PrepareContentPresenterProtocol! { get set }
    
    func updateProgress(_ progress: Float)
}

protocol PrepareContentInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: PrepareContentInteractorOutputProtocol? { get set }
}

protocol PrepareContentInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol PrepareContentPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: PrepareContentViewProtocol? { get set }
    var interactor: PrepareContentInteractorInputProtocol? { get set }
    var router: PrepareContentRouterProtocol? { get set }
    
    func didFinishPreparedContent()
}

protocol PrepareContentRouterProtocol: BaseRouterProtocol, AnyObject {
    func prepareContentToHomeScreen()
}

protocol PrepareContentBuilderProtocol: BaseBuilderProtocol, AnyObject { }
