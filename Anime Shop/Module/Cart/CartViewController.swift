//
//  CartViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit


class CartViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel! { didSet {
        labelTitle.text = TextManager.shared.cartTitleText
        labelTitle.applyStyle(.title)
    }
    }
    @IBOutlet weak var labelText: UILabel! { didSet {
        labelText.text = TextManager.shared.cartSubtitleText
        labelText.applyStyle(.body)
    }
    }
    @IBOutlet weak var priceLabel: UILabel! { didSet {
        priceLabel.text = TextManager.shared.totalText
        priceLabel.applyStyle(.body)
    }
    }
    @IBOutlet weak var totalLabel: UILabel! { didSet {
        totalLabel.text = TextManager.shared.totalText
        totalLabel.applyStyle(.body)
    }
    }
    @IBOutlet weak var checkoutBtn: UIButton! { didSet {
        checkoutBtn.configureButton(
            title: TextManager.shared.checkoutButtonTitle,
            titleFont: TextManager.shared.buttonTitleFont,
            titleColor: .white,
            gradientColors: TextManager.shared.registerButtonGradientColors)
    }
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCart()
    }
    
    private func updateCart() {
        products = CartManager.shared.getProducts()
        tableView.reloadData()
        priceLabel.text = String(format: "S/ %.2f", CartManager.shared.getTotalPrice())
    }
    
    @IBAction func checkoutBtnAction(_ sender: Any) {
        
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func updateProductQuantity(at index: Int, to quantity: Int) {
        let product = products[index]
        CartManager.shared.updateProductQuantity(product, quantity: quantity)
        updateCart()
    }
    
    func removeProduct(at index: Int) {
        let product = products[index]
        CartManager.shared.removeProduct(product)
        updateCart()
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        let product = products[indexPath.row]
        cell.configure(with: product, updateQuantityCallback: { [weak self] quantity in
            self?.updateProductQuantity(at: indexPath.row, to: quantity)
        }, deleteProductCallback: { [weak self] in
            self?.removeProduct(at: indexPath.row)
        })
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

