//
//  SplashViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 7.11.2025.
//

import Lottie
import SnapKit
import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SplashPresenter!
    
    private let appLogoImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init(named: "appLogo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let appNameLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Cleanzy"
        label.textColor = .accent
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private let loadingAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "LoadingAnimation")
        animationView.animationSpeed = 1
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.viewDidLoad()
    }
}

// MARK: - Privates

private extension SplashViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubviews([
            appLogoImageView,
            appNameLabel,
            loadingAnimationView
        ])
    }
    
    func configureLayout() {
        appLogoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(appLogoImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        loadingAnimationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.height.equalTo(192)
        }
    }
}

// MARK: - SplashViewProtocol

extension SplashViewController: SplashViewProtocol { }
