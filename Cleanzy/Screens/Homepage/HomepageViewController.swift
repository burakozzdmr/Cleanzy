//
//  HomepageViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 22.11.2025.
//

import UIKit

final class HomepageViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: HomepagePresenterProtocol!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Privates

private extension HomepageViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
    }
    
    func addViews() {
        
    }
    
    func configureLayout() {
        
    }
}

// MARK: - HomepageViewProtocol

extension HomepageViewController: HomepageViewProtocol {
    
}
