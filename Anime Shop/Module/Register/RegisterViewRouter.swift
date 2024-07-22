//
//  RegisterViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit


protocol RegisterViewRouterProtocol : AnyObject {
    func routerGoToHomeBar()
    func routerGoToLogin()
    func showRegisterError(message: String)
}

class RegisterViewRouter: RegisterViewRouterProtocol {
    
    weak var currentController: RegisterViewController?
    
    
    init(withView view: RegisterViewController) {
        self.currentController = view
    }
    
    func routerGoToHomeBar() {
        print("registrado")
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.currentController?.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
    
    func routerGoToLogin() {
            let storyBoard = UIStoryboard(name: "Login", bundle: nil)
            let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.currentController?.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
    }
    
    func showRegisterError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.currentController?.present(alertController, animated: true, completion: nil)
    }

}

