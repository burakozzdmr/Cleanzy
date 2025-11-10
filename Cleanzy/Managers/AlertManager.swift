//
//  AlertManager.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 10.11.2025.
//

import UIKit

final class AlertManager {
    static let shared = AlertManager()
    
    private init() { }
}

// MARK: - Publics

extension AlertManager {
    static func showAlert(with alertModel: AlertModel) {
        let alertController = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        alertModel.actions?.forEach { alertController.addAction($0) }
        alertModel.viewController.present(alertController, animated: true)
    }
}
