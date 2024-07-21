//
//  DetailViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func displayProductDetails(_ product: Product)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerBar: UIView!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var priceDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var barTitle: UILabel!
    @IBOutlet weak var containerStepper: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelUnity: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var addCartBtn: UIButton!
    @IBOutlet weak var cartIndicatorButton: UIButton!
    @IBOutlet weak var labelButton: UILabel!
    
    // MARK: - Properties
    var presenter: DetailViewPresenterProtocol?
    let configurator = DetailViewConfigurator()
    var digitData: Int = 1
    var isItemSelected: Bool = false
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCartButton()
        presenter?.loadProductDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCartButton()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        configureContainerViews()
        configureLabels()
        setupButtons()
        configureDescriptionDetail()
    }
    
    private func setupButtons() {
        [minusButton, plusButton].forEach {
            $0.tintColor = .black
            $0.layer.borderWidth = 0
        }
    }
    
    func displayProductDetails(_ product: Product) {
            titleDetail.text = product.name
            priceDetail.text = String(format: "$%.2f", product.price)
            descriptionDetail.text = product.description
            if let url = URL(string: product.imageUrl) {
            imageDetail.kf.setImage(with: url)
            }
            
        }
    
    // Botón con efecto rebote
    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                button.transform = .identity
            })
        }
    }
    
    // MARK: - Actions
    @IBAction func minusButtonAction(_ sender: UIButton) {
        if digitData > 1 {
            digitData -= 1
            updateStepper()
            animateButton(sender)
        }
    }
    
    @IBAction func plusButtonAction(_ sender: UIButton) {
        if digitData < 10 {
            digitData += 1
            updateStepper()
            animateButton(sender)
        }
    }
    
    private func updateStepper() {
        labelUnity.text = "\(digitData)"
    }
    
    @IBAction func addCartBtnTapped(_ sender: Any) {
        isItemSelected.toggle()
        configureCartButton()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configurations
    private func configureDescriptionDetail() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.lineSpacing = 4.0
        paragraphStyle.paragraphSpacing = 8.0
        paragraphStyle.hyphenationFactor = 1.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont(name: "Inter-ExtraLight", size: 15) ?? UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor(hex: "#374259")
        ]
        
        descriptionDetail.attributedText = NSAttributedString(string: descriptionDetail.text ?? "", attributes: attributes)
        descriptionDetail.textAlignment = .justified
    }
    
    private func configureLabels() {
        barTitle.text = "Detalles de producto"
        barTitle.applyStyle(.subtitle)
        
        titleDetail.applyStyle(.subtitle)
        titleDetail.textColor = UIColor(hex: "#374259")
        
        priceDetail.applyStyle(.subtitle)
        priceDetail.textColor = UIColor(hex: "#374259")
        
        descriptionDetail.applyStyle(.body)
        descriptionDetail.textColor = UIColor(hex: "#374259")
        
        totalPriceLabel.text = "$ 140.00"
        totalPriceLabel.applyStyle(.body)
        totalPriceLabel.textColor = UIColor(hex: "#374259")
        
        totalLabel.text = "TOTAL"
        totalLabel.applyStyle(.body)
        totalLabel.textColor = UIColor(hex: "#374259")
    }
    
    private func configureContainerViews() {
        containerView2.layer.cornerRadius = 20
        containerStepper.layer.cornerRadius = containerStepper.frame.size.height / 2
    }
    
    private func configureCartButton() {
        addCartBtn.setButtonStyle(isItemSelected ? .gradient : .gray)
        labelButton.text = "Añadir al carrito"
        labelButton.applyStyle(.subtitle)
    }
}

