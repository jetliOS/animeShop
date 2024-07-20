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
    func loadProductDetails()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
   
    weak var view: DetailViewProtocol?
    private var router: DetailViewRouterProtocol!
    var product: Product
    
    init(view: DetailViewProtocol, router: DetailViewRouterProtocol, product: Product) {
        self.view = view
        self.router = router
        self.product = product
    }
   
    
    func goToCart() {
        router.routerGoToCartView()
    }
    func goToHome() {
        router.routerGoToHomeView()
    }
    func loadProductDetails() {
            view?.displayProductDetails(product)
        }
}
