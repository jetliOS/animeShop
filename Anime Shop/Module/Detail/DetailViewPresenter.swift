//
//  DetailViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

protocol DetailViewPresenterProtocol {
    var currentProduct: Product? { get }
    func goToCart()
    func goToHome()
    func loadProductDetails()
        func updateTotalPrice(for quantity: Int)
        func addProductToCart(quantity: Int)
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
    
    var currentProduct: Product? {
        return product
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
        
        func updateTotalPrice(for quantity: Int) {
            let totalPrice = Double(quantity) * product.price
            view?.updateTotalPriceLabel(with: totalPrice)
        }
        
        func addProductToCart(quantity: Int) {
            var productToAdd = product
            productToAdd.quantity = quantity
            CartManager.shared.addProduct(productToAdd)
        }
    
}
