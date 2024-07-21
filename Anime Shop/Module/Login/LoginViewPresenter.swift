//
//  LoginViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit
import FirebaseAuth

protocol LoginViewPresenterProtocol {
    func login(email: String?, password: String?)
    func goToTabBar()
    func goToRegister()
}

class LoginViewPresenter: LoginViewPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    private var router: LoginViewRouterProtocol!
    
    init(view: LoginViewProtocol, router: LoginViewRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func login(email: String?, password: String?) {
        guard let email = email, let password = password else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
                self.router.routerGoToHomeView()
            } else {
                self.router.showLoginError(message: "Se ha producido un error iniciando sesión")
                print(error)
            }
        }
    }
    
    func goToTabBar() {
        router.routerGoToHomeView()
    }
    
    func goToRegister() {
        router.routerGoToRegisterView()
    }
}
