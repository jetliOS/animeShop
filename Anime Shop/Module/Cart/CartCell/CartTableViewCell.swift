//
//  CartTableViewCell.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

class CartTableViewCell: UITableViewCell {


    @IBOutlet weak var stepperContainer: UIView!
    @IBOutlet weak var stackviewStepper: UIStackView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var labelUnity: UILabel! { didSet {
        labelUnity.applyStyle(.subtitle)
    }}

    @IBOutlet weak var labelTitle: UILabel! { didSet {
        labelTitle.applyStyle(.subtitle)
    }}
    @IBOutlet weak var labelPrice: UILabel! { didSet {
        labelPrice.applyStyle(.body)
    }}
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelTotalPrice: UILabel! { didSet {
        labelTotalPrice.applyStyle(.body)
        labelTotalPrice.textAlignment = .right
    }}
    
    var product: Product?
    var updateQuantityCallback: ((Int) -> Void)?
    var deleteProductCallback: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with product: Product, updateQuantityCallback: @escaping (Int) -> Void, deleteProductCallback: @escaping () -> Void) {
        self.product = product
        self.updateQuantityCallback = updateQuantityCallback
        self.deleteProductCallback = deleteProductCallback
        
        labelTitle.text = product.name
        labelPrice.text = String(format: "S/ %.2f", product.price)
        labelUnity.text = "\(product.quantity)"
        updateTotalPrice()
        
        if let url = URL(string: product.imageUrl) {
            imageCell.kf.setImage(with: url)
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func plusBtnTapped(_ sender: Any) {
            if var product = product, product.quantity < 10 {
                product.quantity += 1
                labelUnity.text = "\(product.quantity)"
                updateQuantityCallback?(product.quantity)
            }
        }
        
        @IBAction func minusBtnTapped(_ sender: Any) {
            if var product = product, product.quantity > 1 {
                product.quantity -= 1
                labelUnity.text = "\(product.quantity)"
                updateQuantityCallback?(product.quantity)
            }
        }
    @IBAction func deleteBtn(_ sender: Any) {
        deleteProductCallback?()
        
    }
    
    private func updateTotalPrice() {
            if let product = product {
                let totalPrice = Double(product.quantity) * product.price
                labelTotalPrice.text = String(format: "S/ %.2f", totalPrice)
            }
        }
    
}
