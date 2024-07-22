//
//  WelcomeViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

protocol WelcomeRouterProtocol {
    func navigateToHome()
    func navigateToLogin()
    func navigateToRegister()
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToHome() {
        let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController else { return }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToLogin() {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToRegister() {
        let storyBoard = UIStoryboard(name: "Register", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
