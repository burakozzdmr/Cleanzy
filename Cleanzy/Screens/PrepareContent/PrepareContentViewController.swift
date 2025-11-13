//
//  PrepareContentViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import UIKit

class PrepareContentViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: PrepareContentPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - PrepareContentViewProtocol

extension PrepareContentViewController: PrepareContentViewProtocol { }
