//
//  ForgotPasswordViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import SnapKit
import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - Properties

    var presenter: ForgotPasswordPresenter!
    
    private let codeDescriptionLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Şifre sıfırlama bağlantısını size iletebilmemiz için e-posta veya telefon numaranıza ihtiyacımız var."
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var codeTextField: AuthenticationTextField = {
        let textField: AuthenticationTextField = .init(placeholder: "E-posta veya telefon numarası", keyboardType: .default, leftIcon: "at")
        textField.delegate = self
        return textField
    }()
    
    private lazy var sendCodeButton: UIButton = {
        let button: UIButton = .init()
        button.tintColor = .white
        button.backgroundColor = .accent
        button.setTitle("Şifre Sıfırlama Bağlantısını Gönder", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(sendCodeTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Privates

private extension ForgotPasswordViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
        navigationItem.title = "Şifremi Unuttum"
    }
    
    func addViews() {
        view.addSubviews([
            codeDescriptionLabel,
            codeTextField,
            sendCodeButton
        ])
    }
    
    func configureLayout() {
        codeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        
        codeTextField.snp.makeConstraints {
            $0.top.equalTo(codeDescriptionLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(400)
            $0.height.equalTo(56)
        }
        
        sendCodeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.width.equalTo(400)
            $0.height.equalTo(64)
        }
    }
}

// MARK: - Objective-C Methods

@objc private extension ForgotPasswordViewController {
    func sendCodeTapped() {
        
    }
}

// MARK: - ForgotPasswordViewProtocol

extension ForgotPasswordViewController: ForgotPasswordViewProtocol {
    
}

// MARK: - UITextFieldDelegate

extension ForgotPasswordViewController: UITextFieldDelegate {
    
}

#Preview {
    ForgotPasswordViewController()
}
