//
//  LoginViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit
protocol LoginViewRouterProtocol {
    func routerGoToHomeView()
    func routerGoToRegisterView()
    func showLoginError(message: String)
}

class LoginViewRouter: LoginViewRouterProtocol {
    
    weak var currentController: LoginViewController?
    
    
    init(withView view: LoginViewController) {
        self.currentController = view
    }
    func routerGoToHomeView() {
        print("registrado")
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.currentController?.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
        
    }
    
    func routerGoToRegisterView() {
        let storyBoard = UIStoryboard(name: "Register", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.currentController?.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
    
    func showLoginError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.currentController?.present(alertController, animated: true, completion: nil)
    }
}

