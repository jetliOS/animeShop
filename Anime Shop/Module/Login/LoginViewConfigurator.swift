//
//  LoginViewConfigurator.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import Foundation

protocol LoginViewConfiguratorProtocol {
    func configure(viewcontroller: LoginViewController)
}
class LoginViewConfigurator {
    func configure(viewcontroller: LoginViewController) {
        viewcontroller.presenter = LoginViewPresenter(view: viewcontroller, router: LoginViewRouter(withView: viewcontroller))
    }
}


