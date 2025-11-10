//
//  RegisterViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: RegisterPresenter!
    
    private let appLogoImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init(named: "appLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let registerLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Kayıt Ol"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let userTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl: UISegmentedControl = .init(items: ["Müşteri", "Temizlikçi"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white.withAlphaComponent(0.9)
        segmentedControl.selectedSegmentTintColor = .accent
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]
        
        segmentedControl.setTitleTextAttributes(normalAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        return segmentedControl
    }()
    
    private lazy var nameTextField: AuthenticationTextField = {
        let textField = AuthenticationTextField(
            placeholder: "Adınızı ve soyadınızı girin",
            leftIcon: "person.text.rectangle"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var emailTextField: AuthenticationTextField = {
        let textField = AuthenticationTextField(
            placeholder: "E-postanızı girin",
            leftIcon: "envelope.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: AuthenticationTextField = {
        let textField = AuthenticationTextField(
            placeholder: "Şifrenizi girin",
            leftIcon: "lock.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var repasswordTextField: AuthenticationTextField = {
        let textField = AuthenticationTextField(
            placeholder: "Şifrenizi tekrar girin",
            leftIcon: "lock.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Kayıt Ol", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.backgroundColor = .accent
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Privates

private extension RegisterViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubviews([
            appLogoImageView,
            registerLabel,
            userTypeSegmentedControl,
            nameTextField,
            emailTextField,
            passwordTextField,
            repasswordTextField,
            registerButton
        ])
    }
    
    func configureLayout() {
        appLogoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        registerLabel.snp.makeConstraints {
            $0.top.equalTo(appLogoImageView.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        userTypeSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(registerLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(userTypeSegmentedControl.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        repasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(repasswordTextField.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
    }
}

// MARK: - Objective-C Methods

@objc private extension RegisterViewController {
    func registerTapped() {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text else { return }
        presenter.didRegisterTapped(with: emailText, and: passwordText)
    }
}

// MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    
}

// MARK: - RegisterViewProtocol

extension RegisterViewController: RegisterViewProtocol {
    func showLoading() {
        // TODO: CUSTOM LOADING VIEW SHOW LOGIC
    }
    
    func hideLoading() {
        // TODO: CUSTOM LOADING VIEW HIDDEN LOGIC
    }
    
    func showAlert() {
        AlertManager.shared.showAlert(
            with: AlertModel(
                title: "HATA",
                message: "Kayıt işlemi başarısız",
                actions: [
                    UIAlertAction(title: "Tamam", style: .default)
                ]
            ),
            from: self
        )
    }
}

#Preview {
    RegisterViewController()
}
