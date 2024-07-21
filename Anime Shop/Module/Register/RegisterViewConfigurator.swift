//
//  RegisterViewConfigurator.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

protocol RegisterViewConfiguratorProtocol {
    func configure(viewcontroller: RegisterViewController)
}

class RegisterViewConfigurator : RegisterViewConfiguratorProtocol {
    
    func configure(viewcontroller: RegisterViewController) {
        viewcontroller.presenter = RegisterViewPresenter(view: viewcontroller, router: RegisterViewRouter(withView: viewcontroller))
    }
}
