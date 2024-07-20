//
//  Product.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import Foundation

// Definición de la estructura del Producto
struct Product {
    var id: String
    var name: String
    var category: String
    var description: String
    var imageUrl: String
    var price: Double
}

// Extensión para inicializar desde un diccionario
extension Product {
    init?(dictionary: [String: Any], id: String) {
        guard let name = dictionary["name"] as? String,
              let category = dictionary["category"] as? String,
              let description = dictionary["description"] as? String,
              let imageUrl = dictionary["imageUrl"] as? String,
              let price = dictionary["price"] as? Double else {
            return nil
        }

        self.id = id
        self.name = name
        self.category = category
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
    }
}
