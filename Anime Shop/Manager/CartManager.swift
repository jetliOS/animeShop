//
//  CartManager.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private init() {}
    
    private var products: [Product] = []
    
    func addProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += product.quantity
        } else {
            products.append(product)
        }
    }
    
    func updateProductQuantity(_ product: Product, quantity: Int) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity = quantity
        }
    }
    
    func removeProduct(_ product: Product) {
        products.removeAll { $0.id == product.id }
    }
    
    func getTotalPrice() -> Double {
        return products.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    func getProducts() -> [Product] {
        return products
    }
}