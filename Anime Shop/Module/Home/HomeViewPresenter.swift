//
//  HomeViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit
import FirebaseFirestore

protocol HomeViewPresenterProtocol {
    func goToDetail()
    func fetchProducts()
}

class HomeViewPresenter: HomeViewPresenterProtocol {
   
    weak var view: HomeViewProtocol?
    private var router: HomeViewRouterProtocol!
    
    init(view: HomeViewProtocol, router: HomeViewRouterProtocol) {
        self.view = view
        self.router = router
    }
   
    func goToDetail() {
        router.routerGoToDetailView()
    }
    
    func fetchProducts() {
            Firestore.firestore().collection("productos").getDocuments { snapshot, error in
                if let error = error {
                    self.view?.displayError(error.localizedDescription)
                    return
                }
                guard let documents = snapshot?.documents else {
                    self.view?.displayError("No documents found")
                    return
                }
                let products = documents.compactMap { doc -> Product? in
                    return Product(dictionary: doc.data(), id: doc.documentID)
                }
                self.view?.displayProducts(products)
                print("Productos recuperados: \(products)")
            }
        }
    
}

