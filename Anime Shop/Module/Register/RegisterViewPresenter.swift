//
//  RegisterViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth

protocol RegisterViewPresenterProtocol: AnyObject {
    func registerUser(email: String, password: String)
    func goToTabBar()
    func goToLogin()
}

class RegisterViewPresenter: RegisterViewPresenterProtocol {
    
    weak var view: RegisterViewControllerProtocol?
    private var router: RegisterViewRouterProtocol!
    
    init(view: RegisterViewController, router: RegisterViewRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
                self.router?.routerGoToHomeBar()
                print("registrado")
            } else {
                self.router?.showRegisterError(message: "Se ha producido un error registrando el usuario")
            }
        }
    }
    
    func goToLogin() {
        router.routerGoToLogin()
    }
    
    func goToTabBar() {
        router.routerGoToHomeBar()
    }
}



