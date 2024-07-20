//
//  HomeViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit
protocol HomeViewRouterProtocol {
    func routerGoToDetailView(with product: Product)
}

class HomeViewRouter: HomeViewRouterProtocol {
    weak var currentController: HomeViewController?
    
    
    init(withView view: HomeViewController) {
        self.currentController = view
    }
    func routerGoToDetailView(with product: Product) {
            let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
            guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
            
            // Configurar el DetailViewController con el producto
            let configurator = DetailViewConfigurator()
            configurator.configure(viewcontroller: detailVC, with: product)
            
            self.currentController?.navigationController?.pushViewController(detailVC, animated: true)
        }
}
