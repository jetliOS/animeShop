//
//  HomeCollectionViewCell.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageCard: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabels()
        configureContainers()
        
    }
    
    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = "S/\(product.price)"
        if let url = URL(string: product.imageUrl) {
            productImageView.kf.setImage(with: url)
        }
    }
    func configureLabels() {
        productNameLabel.numberOfLines = 0
        productNameLabel.font = UIFont(name: "Avenir-Medium", size: 14)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.applyStyle(.body)
    }
    
    func configureContainers() {
        
        containerView.layer.cornerRadius = 15
        containerView.setupShadowHex(shadowColorHex: "#7E92DE")
        imageCard.layer.cornerRadius = 10
    
    }
}
