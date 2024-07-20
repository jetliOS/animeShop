//
//  HomeViewRouter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit
protocol HomeViewRouterProtocol {
    func routerGoToDetailView()
}

class HomeViewRouter: HomeViewRouterProtocol {
    weak var currentController: HomeViewController?
    
    
    init(withView view: HomeViewController) {
        self.currentController = view
    }
    func routerGoToDetailView() {
        let storyBoard = UIStoryboard(name: "DetailView", bundle: nil)
        let didTapSnackBarAlert = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        self.currentController?.navigationController?.pushViewController(didTapSnackBarAlert!, animated: true)
        
    }
}
