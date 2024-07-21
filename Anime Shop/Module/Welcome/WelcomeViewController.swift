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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var omitirButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialTransforms()
        setupLabel()
        delayPresentation()
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
        let text = "AnimeShop"
        let attributedString = NSMutableAttributedString(string: text)
        
        let commonFont = UIFont(name: "Avenir-Heavy", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
        attributedString.addAttribute(.font, value: commonFont, range: NSRange(location: 0, length: text.count))
        
        let animeRange = (text as NSString).range(of: "Anime")
        attributedString.addAttribute(.foregroundColor, value: UIColor(hex: "#535BE8"), range: animeRange)
        
        let shopRange = (text as NSString).range(of: "Shop")
        attributedString.addAttribute(.foregroundColor, value: UIColor(hex: "#0E0E2E"), range: shopRange)
        
        labelWelcome.attributedText = attributedString
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
    
    // MARK: - Navigation
    private func delayPresentation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print("listo")
//            self.presentHomeViewController()
        }
    }
    
    
    
    // MARK: - ROUTER Navigate options
    
    private func presentHomeViewController() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
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

