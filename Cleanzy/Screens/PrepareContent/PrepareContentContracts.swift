//
//  PrepareContentContracts.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

protocol PrepareContentViewProtocol: BaseViewProtocol, AnyObject { }

protocol PrepareContentInteractorInputProtocol: BaseInteractorInputProtocol, AnyObject { }

protocol PrepareContentInteractorOutputProtocol: BaseInteractorOutputProtocol, AnyObject { }

protocol PrepareContentPresenterProtocol: BasePresenterProtocol, AnyObject {
    func didFinishPreparedContent()
}

protocol PrepareContentRouterProtocol: BaseRouterProtocol, AnyObject {
    func prepareContentToHomeScreen()
}

protocol PrepareContentBuilderProtocol: BaseBuilderProtocol, AnyObject { }

