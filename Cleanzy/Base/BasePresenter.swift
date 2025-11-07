//
//  BasePresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import Foundation

class BasePresenter {
    weak var view: BaseViewController?
    var interactor: BaseInteractor?
    var router: BaseRouter?
}

extension BasePresenter: BasePresenterProtocol {
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
}

extension BasePresenter: BaseInteractorOutputProtocol { }
