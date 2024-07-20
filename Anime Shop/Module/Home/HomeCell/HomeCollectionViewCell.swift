//
//  HomeCollectionViewCell.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = "S/\(product.price)"
        if let url = URL(string: product.imageUrl) {
            productImageView.kf.setImage(with: url)
        }
    }
}
