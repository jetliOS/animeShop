//
//  DetailViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit
protocol DetailViewRouterProtocol {
    func routerGoToCartView()
    func routerGoToHomeView()
}

class DetailViewRouter: DetailViewRouterProtocol {
    weak var currentController: DetailViewController?
    
    
    init(withView view: DetailViewController) {
        self.currentController = view
    }
    func routerGoToCartView() {
        
    }
    func routerGoToHomeView() {
        self.currentController?.navigationController?.popViewController(animated: true)
    }
}
