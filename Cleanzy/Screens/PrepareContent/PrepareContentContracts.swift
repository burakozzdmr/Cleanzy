//
//  PrepareContentContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

protocol PrepareContentViewProtocol: BaseViewProtocol, AnyObject {
    var presenter: PrepareContentPresenter! { get set }
    
    func updateProgress(_ progress: Float)
}

protocol PrepareContentInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject {
    var presenter: PrepareContentPresenter? { get set }
}

protocol PrepareContentInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol PrepareContentPresenterProtocol: BasePresenterProtocol, AnyObject {
    var view: PrepareContentViewController? { get set }
    var interactor: PrepareContentInteractor? { get set }
    var router: PrepareContentRouter? { get set }
    
    func didFinishPreparedContent()
}

protocol PrepareContentRouterProtocol: BaseRouterProtocol, AnyObject {
    var view: PrepareContentViewController? { get set }
    
    func prepareContentToHomeScreen()
}

protocol PrepareContentBuilderProtocol: BaseBuilderProtocol, AnyObject { }
