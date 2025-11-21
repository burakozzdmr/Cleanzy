//
//  PrepareContentInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Foundation

final class PrepareContentInteractor {
    weak var presenter: PrepareContentInteractorOutputProtocol?
}

extension PrepareContentInteractor: PrepareContentInteractorInputProtocol { }

