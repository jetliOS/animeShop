//
//  HomeViewConfigurator.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import Foundation

protocol HomeViewConfiguratorProtocol {
    func configure(viewcontroller: HomeViewController)
}
class HomeViewConfigurator {
    func configure(viewcontroller: HomeViewController) {
        viewcontroller.presenter = HomeViewPresenter(view: viewcontroller, router: HomeViewRouter(withView: viewcontroller))
    }
}
