//
//  DetailViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

protocol DetailViewPresenterProtocol {
    func goToCart()
    func goToHome()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
   
    
    
    weak var view: DetailViewProtocol?
    private var router: DetailViewRouterProtocol!
    
    init(view: DetailViewProtocol, router: DetailViewRouterProtocol) {
        self.view = view
        self.router = router
    }
   
    
    func goToCart() {
        router.routerGoToCartView()
    }
    func goToHome() {
        router.routerGoToHomeView()
    }
}
