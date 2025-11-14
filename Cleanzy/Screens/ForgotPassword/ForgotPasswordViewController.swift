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
        label.text = "Şifre sıfırlama bağlantısını size iletebilmemiz için e-posta adresinize ihtiyacımız var."
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var emailTextField: AuthenticationTextField = {
        let textField: AuthenticationTextField = .init(placeholder: "ornek@gmail.com", keyboardType: .default, leftIcon: "at")
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
        button.addTarget(self, action: #selector(sendResetPasswordLinkTapped), for: .touchUpInside)
        return button
    }()
    
    private let loadingView: AuthenticationLoadingView = .init()
    
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
            emailTextField,
            sendCodeButton
        ])
    }
    
    func configureLayout() {
        codeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        
        emailTextField.snp.makeConstraints {
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
    func sendResetPasswordLinkTapped() {
        let emailText = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if emailText.isEmpty {
            AlertManager.shared.showAlert(
                with: .init(
                    title: "HATA",
                    message: "Lütfen geçerli bir e-posta adresi giriniz.",
                ),
                from: self
            )
            return
            
        } else if !(emailText.contains("@") && emailText.contains(".com")) {
            AlertManager.shared.showAlert(
                with: .init(
                    title: "UYARI",
                    message: "E-Posta adresiniz uygun formatta değil"
                ),
                from: self
            )
            return
            
        } else {
            presenter.didSendPasswordLinkTapped(with: emailText)
        }
    }
}

// MARK: - ForgotPasswordViewProtocol

extension ForgotPasswordViewController: ForgotPasswordViewProtocol {
    func showLoading() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func hideLoading() {
        loadingView.removeFromSuperview()
    }
    
    func showAlert(with errorMessage: String) {
        AlertManager.shared.showAlert(
            with: .init(
                title: "HATA",
                message: errorMessage
            ),
            from: self
        )
    }
}

// MARK: - UITextFieldDelegate

extension ForgotPasswordViewController: UITextFieldDelegate {
    
}

#Preview {
    ForgotPasswordViewController()
}
