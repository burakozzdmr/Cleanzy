//
//  PrepareContentViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import Lottie
import SnapKit
import UIKit

class PrepareContentViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: PrepareContentPresenter!
    
    private let prepareContentAnimationView: LottieAnimationView = {
        let lottieView: LottieAnimationView = .init(name: "PrepareContentCleanerAnimation")
        lottieView.animationSpeed = 2
        lottieView.contentMode = .scaleToFill
        lottieView.loopMode = .loop
        lottieView.play()
        return lottieView
    }()
    
    private let loadingLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Deneyiminizi Kişiselleştiriyoruz..."
        label.textColor = .accent
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    private let loadingProgressView: UIProgressView = {
        let progressView: UIProgressView = .init()
        progressView.progress = 0
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .accent
        progressView.trackTintColor = .systemGray4
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
}

// MARK: - Privates

private extension PrepareContentViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubviews([
            prepareContentAnimationView,
            loadingLabel,
            loadingProgressView
        ])
    }
    
    func configureLayout() {
        prepareContentAnimationView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(128)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(256)
        }
        
        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(prepareContentAnimationView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
        }
        
        loadingProgressView.snp.makeConstraints {
            $0.top.equalTo(loadingLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(8)
        }
    }
}

// MARK: - PrepareContentViewProtocol

extension PrepareContentViewController: PrepareContentViewProtocol {
    func updateProgress(_ progress: Float) {
        loadingProgressView.setProgress(progress, animated: true)
    }
}

#Preview {
    PrepareContentViewController()
}
