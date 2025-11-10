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
    static func showAlert(with alertModel: AlertModel, for viewController: UIViewController) {
        let alertController = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        
        if let safeActions = alertModel.actions {
            for action in safeActions {
                alertController.addAction(action)
            }
        }
        
        viewController.present(alertController, animated: true)
    }
}
