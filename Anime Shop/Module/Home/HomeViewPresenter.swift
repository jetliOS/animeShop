//
//  HomeViewPresenter.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

protocol HomeViewPresenterProtocol {
    func goToDetail()
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
}

