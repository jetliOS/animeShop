//
//  RegisterViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit
import FirebaseAuth


protocol RegisterViewControllerProtocol: AnyObject {}

class RegisterViewController: UIViewController, RegisterViewControllerProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel! { didSet {
        labelTitle.text = TextManager.shared.createAccount
        labelTitle.applyStyle(.title)
    }}
    
    @IBOutlet weak var labelAnswer: UILabel! { didSet {
        labelAnswer.applyStyle(.body)
    }}
    @IBOutlet weak var loginAcces: UIButton! { didSet {
        loginAcces.setTitle(TextManager.shared.signIn, for: .normal)
        loginAcces.applyStyle(.subtitle, backgroundColor: .clear)
        loginAcces.setTitleColor(ColorManager.color.orange, for: .normal)
    }}
    @IBOutlet weak var fieldView: UIView! { didSet {
        fieldView.backgroundColor = ColorManager.color.darkBackground
    }}
    @IBOutlet var backgroundView: UIView! { didSet {
        backgroundView.backgroundColor = ColorManager.color.background
    }}
    @IBOutlet weak var logo2: UIImageView!
    @IBOutlet weak var userRegisterText: UITextField! { didSet {
        userRegisterText.configure(placeholder: TextManager.shared.user, placeholderColor: .lightGray, textColor: .white)
    }}
    @IBOutlet weak var passwordRegisterText: UITextField! { didSet {
        passwordRegisterText.configure(placeholder: TextManager.shared.user, placeholderColor: .lightGray, textColor: .white)
    }}
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var appleButton: UIButton! { didSet {
        appleButton.setupAppleButton()
        appleButton.setupAppleButton()
    }}
    @IBOutlet weak var googleButton: UIButton! { didSet {
        googleButton.setupGoogleButton()
    }}
    
    var presenter: RegisterViewPresenterProtocol!
    let configurator = RegisterViewConfigurator()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        configurator.configure(viewcontroller: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        registerButton.updateGradientFrame()
        googleButton.updateGradientFrame()
        appleButton.updateGradientFrame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logo2.startLevitating()
    }
    
    // MARK: - Actions
    @IBAction func loginAccesButton(_ sender: Any) {
        presenter.goToLogin()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let email = userRegisterText.text, let password = passwordRegisterText.text else {
            return
        }
        presenter.registerUser(email: email, password: password)
    }
    
    // MARK: - UI Setup
    private func setUpUI() {
        configureFieldView()
        configureBackButton()
        userRegisterText.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordRegisterText.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        updateRegisterButtonState()
    }
    
    func configureFieldView() {
        fieldView.layer.cornerRadius = 25
        fieldView.layer.masksToBounds = true
    }
    
    @objc private func textFieldsDidChange() {
        updateRegisterButtonState()
    }
    private func updateRegisterButtonState() {
        let isEmailValid = isValidEmail(userRegisterText.text)
        let isPasswordValid = isValidPassword(passwordRegisterText.text)
        
        let style = (isEmailValid && isPasswordValid) ? ButtonStyle.orangeGradient : ButtonStyle.gray
        registerButton.configure(title: TextManager.shared.loginButtonTitle, titleFont: TextManager.shared.buttonTitleFont, titleColor: .white, style: style, isEnabled: isEmailValid && isPasswordValid)
        
    }
    
    private func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        return email.contains("@")
    }
    
    private func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password.count > 5
    }
    
    func configureBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = backButton
    }
}

