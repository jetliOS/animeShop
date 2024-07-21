//
//  HomeViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit
import FirebaseFirestore

protocol HomeViewPresenterProtocol {
    func goToDetail(with product: Product)
    func filterProducts(byCategory category: String?)
    func filterProducts(bySearchText searchText: String)
    func fetchProducts()
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    
    weak var view: HomeViewProtocol?
    private var router: HomeViewRouterProtocol!
    
    private var allProducts: [Product] = []
    private var filteredProducts: [Product] = []
    
    init(view: HomeViewProtocol, router: HomeViewRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func goToDetail(with product: Product) {
        router.routerGoToDetailView(with: product)
    }
    
    func fetchProducts() {
            Firestore.firestore().collection("productos").getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else {
                    self.view?.displayError("No documents found")
                    return
                }
                
                self.allProducts = documents.compactMap { doc -> Product? in
                    return Product(dictionary: doc.data(), id: doc.documentID)
                }
                self.filteredProducts = self.allProducts
                self.view?.displayProducts(self.filteredProducts)
            }
        }
    
    func filterProducts(byCategory category: String?) {
        if let category = category, category != "Todos" {
            filteredProducts = allProducts.filter { $0.category == category }
        } else {
            filteredProducts = allProducts
        }
        view?.displayProducts(filteredProducts)
    }
    
    func filterProducts(bySearchText searchText: String) {
        if searchText.isEmpty {
            filteredProducts = allProducts
        } else {
            filteredProducts = allProducts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        view?.displayProducts(filteredProducts)
    }
    
}

