//
//  BaseViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import UIKit

class BaseViewController<Presenter: BasePresenter>: UIViewController {
    
    private let presenter: Presenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(presenter: Presenter = .init()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Privates

private extension BaseViewController {
    func setupUI() { }
    
    func addViews() { }
    
    func configureLayout() { }
}
