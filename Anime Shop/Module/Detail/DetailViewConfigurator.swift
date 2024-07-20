//
//  DetailViewConfigurator.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import Foundation

protocol DetailViewConfiguratorProtocol {
    func configure(viewcontroller: DetailViewController)
}
class DetailViewConfigurator {
    func configure(viewcontroller: DetailViewController) {
        viewcontroller.presenter = DetailViewPresenter(view: viewcontroller, router: DetailViewRouter(withView: viewcontroller))
    }
}
