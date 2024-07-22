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
    @IBOutlet weak var productNameLabel: UILabel! { didSet {
        productNameLabel.applyStyle(.titleCell)
        productNameLabel.numberOfLines = 0
    }}
    @IBOutlet weak var productPriceLabel: UILabel! { didSet {
        productPriceLabel.applyStyle(.body)
    }}
    override func awakeFromNib() {
        super.awakeFromNib()
        configureContainers()
    }
    
    func configure(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = "S/\(product.price)"
        if let url = URL(string: product.imageUrl) {
            productImageView.kf.setImage(with: url)
        }
    }
    
    func configureContainers() {
        containerView.layer.cornerRadius = 15
        containerView.setupShadow(shadowColor: .black)
        containerView.backgroundColor = ColorManager.color.darkBackground
        containerView.layer.borderColor = ColorManager.color.purpleBlue.cgColor
        containerView.layer.borderWidth = 0.7
        imageCard.layer.cornerRadius = 10
    }
}
