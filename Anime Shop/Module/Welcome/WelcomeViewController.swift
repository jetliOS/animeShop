//
//  ViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imageWelcome: UIImageView!
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var loginButton: UIButton! {
        didSet{
            loginButton.configureButton(
                title: TextManager.shared.loginButtonTitle,
                titleFont: TextManager.shared.buttonTitleFont,
                titleColor: .white,
                gradientColors: TextManager.shared.loginButtonGradientColors
            )
        }
    }
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.configureButton(
                title: TextManager.shared.registerButtonTitle,
                titleFont: TextManager.shared.buttonTitleFont,
                titleColor: .white,
                gradientColors: TextManager.shared.registerButtonGradientColors
            )
        }
    }
    @IBOutlet weak var skipButton: UIButton! {
        didSet {
            skipButton.configureButton(
                title: TextManager.shared.skipButtonTitle,
                titleFont: TextManager.shared.buttonTitleFont,
                titleColor: .white,
                gradientColors: TextManager.shared.skipButtonGradientColors
            )
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialTransforms()
        setupLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateElements()
    }
    
    // MARK: - Actions
    @IBAction func loginTapped(_ sender: Any) {
        goToLoginView()
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        goToRegisterView()
    }
    
    @IBAction func omitirTapped(_ sender: Any) {
        presentHomeViewController()
    }
    // MARK: - Setup Methods
    private func setupLabel() {
        labelWelcome.attributedText = TextManager.shared.attributedWelcomeText()
    }
    
    private func setupInitialTransforms() {
        imageWelcome.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        labelWelcome.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height)
    }
    
    // MARK: - Animation Methods
    private func animateElements() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.imageWelcome.transform = .identity
            self.labelWelcome.transform = .identity
        }
    }
    
    // MARK: - ROUTER Navigate options
    private func presentHomeViewController() {
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController

        self.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
    
    func goToLoginView() {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
    
    func goToRegisterView() {
        let storyBoard = UIStoryboard(name: "Register", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
}

