//
//  PrepareContentPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

class PrepareContentPresenter {
    weak var view: PrepareContentViewController?
    var interactor: PrepareContentInteractor?
    var router: PrepareContentRouter?
}

extension PrepareContentPresenter: PrepareContentPresenterProtocol { }

extension PrepareContentPresenter: PrepareContentInteractorOutputProtocol { }
