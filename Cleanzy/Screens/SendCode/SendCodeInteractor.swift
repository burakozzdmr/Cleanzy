//
//  SendCodeInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import Foundation

final class SendCodeInteractor {
    weak var presenter: SendCodeInteractorOutputProtocol?
}

extension SendCodeInteractor: SendCodeInteractorInputProtocol { }
