//
//  LoginViewController.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    
    var presenter: LoginPresenter!
    
    private let appLogoImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init(named: "appLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Hoş Geldiniz"
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
    
    private lazy var emailTextField: UITextField = {
        let textField = AuthenticationTextField(
            placeholder: "E-posta",
            leftIcon: "envelope.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = AuthenticationTextField(
            placeholder: "Parola",
            leftIcon: "lock.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var forgotPasswordLabel: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Şifremi Unuttum", for: .normal)
        button.setTitleColor(.accent, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Giriş Yap", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.backgroundColor = .accent
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Hesabınız yok mu?"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var joinUsButton: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Aramıza Katıl", for: .normal)
        button.setTitleColor(.accent, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(joinUsTapped), for: .touchUpInside)
        return button
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let loadingView: AuthenticationLoadingView = .init()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Privates

private extension LoginViewController {
    func setupUI() {
        addViews()
        configureLayout()
        
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubviews([
            appLogoImageView,
            welcomeLabel,
            userTypeSegmentedControl,
            emailTextField,
            passwordTextField,
            forgotPasswordLabel,
            loginButton,
            dontHaveAccountLabel,
            joinUsButton,
            bottomStackView
        ])
        bottomStackView.addArrangedSubview(dontHaveAccountLabel)
        bottomStackView.addArrangedSubview(joinUsButton)
    }
    
    func configureLayout() {
        appLogoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(appLogoImageView.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        userTypeSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(userTypeSegmentedControl.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(56)
        }
        
        forgotPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordLabel.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}

// MARK: - Objective-C Methods

@objc private extension LoginViewController {
    func loginTapped() {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text else { return }
        presenter.didLoginTapped(with: emailText, and: passwordText)
    }
    
    func forgotPasswordTapped() {
        presenter.didForgotPasswordTapped()
    }
    
    func joinUsTapped() {
        presenter.didRegisterTapped()
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    func showLoading() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func hideLoading() {
        loadingView.removeFromSuperview()
    }
    
    func showAlert() {
        AlertManager.shared.showAlert(
            with: AlertModel(
                title: "HATA",
                message: "Kullanıcı adı veya şifre hatalı",
                actions: [
                    UIAlertAction(title: "Tamam", style: .default, handler: nil)
                ]
            ),
            from: self
        )
    }
}

#Preview {
    LoginViewController()
}
