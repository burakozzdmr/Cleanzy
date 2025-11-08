//
//  SplashViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SplashPresenter!
    
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Privates

private extension SplashViewController {
    func setupUI() {
        
    }
    
    func addViews() {
        
    }
    
    func configureLayout() {
        
    }
}

// MARK: - SplashViewProtocol

extension SplashViewController: SplashViewProtocol {
    
}
