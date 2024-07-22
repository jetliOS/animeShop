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
    @IBOutlet weak var labelWelcome: UILabel! { didSet {
            labelWelcome.attributedText = TextManager.shared.attributedWelcomeText()
    }}
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
    // MARK: - Properties
    var router: WelcomeRouterProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialTransforms()
        router = WelcomeRouter(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateElements()
    }
    
    // MARK: - Actions
    @IBAction func loginTapped(_ sender: Any) {
        router.navigateToLogin()
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        router.navigateToRegister()
    }
    
    @IBAction func omitirTapped(_ sender: Any) {
        router.navigateToHome()
    }
    // MARK: - Setup Methods
    
    
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
}

