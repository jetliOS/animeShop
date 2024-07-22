//
//  LoginViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit
import FirebaseAuth

protocol LoginViewProtocol: AnyObject {}

class LoginViewController: UIViewController, LoginViewProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var logo1: UIImageView!
    @IBOutlet weak var passwordVisibilityButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var userLoginText: UITextField!
    @IBOutlet weak var passwordLoginText: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var loginApple: UIButton!
    @IBOutlet weak var loginGoogle: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var presenter: LoginViewPresenterProtocol?
    let configurator = LoginViewConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewcontroller: self)
        setupLogin()
        setLabelTitle()
        configureTextFields()
        updateLoginButtonState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startLevitating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientFrames()
    }
    
    @IBAction func registratButtonAction(_ sender: Any) {
        presenter?.goToRegister()
    }
    
    @IBAction func buttonLoginAction(_ sender: Any) {
        presenter?.login(email: userLoginText.text, password: passwordLoginText.text)
    }
    
    private func setLabelTitle() {
        welcomeLabel.text = TextManager.shared.loginWelcomeLabelText
        welcomeLabel.applyStyle(.title)
    }
    
    private func configureTextFields() {
        userLoginText.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordLoginText.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldsDidChange() {
        updateLoginButtonState()
    }
    
    private func updateLoginButtonState() {
            let isEmailValid = isValidEmail(userLoginText.text)
            let isPasswordValid = isValidPassword(passwordLoginText.text)
            
            let style = (isEmailValid && isPasswordValid) ? ButtonStyle.gradient : ButtonStyle.gray
            buttonLogin.configure(title: TextManager.shared.loginButtonTitleText, titleFont: .systemFont(ofSize: 18, weight: .bold), titleColor: .white, style: style, isEnabled: isEmailValid && isPasswordValid)
        }
    
    private func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        return email.contains("@")
    }
    
    private func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password.count > 5
    }
    
    private func setupLogin() {
        fieldView.layer.cornerRadius = 20
        setupPasswordVisibilityButton()
        configureBackButton()
        loginApple.setupAppleButton()
        loginGoogle.setupGoogleButton()
    }
    
    private func startLevitating() {
        logo1.startLevitating()
    }
    
    private func configureBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = backButton
    }
    
    // MARK: - Password Visibility Methods
    private func setupPasswordVisibilityButton() {
        let image = UIImage(systemName: "eye.slash")
        passwordVisibilityButton.setImage(image, for: .normal)
        passwordVisibilityButton.tintColor = .darkGray
        passwordVisibilityButton.imageView?.contentMode = .scaleAspectFit
        passwordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    @objc private func togglePasswordVisibility() {
        passwordLoginText.isSecureTextEntry.toggle()
        let imageName = passwordLoginText.isSecureTextEntry ? "eye.slash" : "eye"
        let image = UIImage(systemName: imageName)
        passwordVisibilityButton.setImage(image, for: .normal)
    }
    
    private func updateGradientFrames() {
        loginApple.updateGradientFrame()
        loginGoogle.updateGradientFrame()
        buttonLogin.updateGradientFrame()
    }
}
