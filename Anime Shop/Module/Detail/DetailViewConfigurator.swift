//
//  DetailViewConfigurator.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import Foundation

protocol DetailViewConfiguratorProtocol {
    func configure(viewcontroller: DetailViewController, with product: Product)
}

class DetailViewConfigurator: DetailViewConfiguratorProtocol {
    func configure(viewcontroller: DetailViewController, with product: Product) {
        let router = DetailViewRouter(withView: viewcontroller)
        let presenter = DetailViewPresenter(view: viewcontroller, router: router, product: product)
        viewcontroller.presenter = presenter
    }
}
