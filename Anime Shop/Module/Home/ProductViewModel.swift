//
//  ProductViewModel.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import Foundation

struct Product: Codable {
    let description: String
    let name: String
    let price: Double
    let imageUrl: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case name
        case price
        case imageUrl = "imageurl"
        case category
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        
        if let priceString = try? container.decode(String.self, forKey: .price), let price = Double(priceString) {
            self.price = price
        } else if let priceDouble = try? container.decode(Double.self, forKey: .price) {
            self.price = priceDouble
        } else if let priceInt = try? container.decode(Int.self, forKey: .price) {
            self.price = Double(priceInt)
        } else {
            throw DecodingError.typeMismatch(Double.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Price type is not valid"))
        }
        
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}
