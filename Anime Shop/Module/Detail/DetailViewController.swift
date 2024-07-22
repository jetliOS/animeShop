//
//  DetailViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//
import UIKit

protocol DetailViewProtocol: AnyObject {
    func displayProductDetails(_ product: Product)
    func updateTotalPriceLabel(with totalPrice: Double)
    func updateCartButtonState(isItemSelected: Bool)
    
}
class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView! { didSet {
        containerView2.backgroundColor = ColorManager.color.darkBackground
    }}

    @IBOutlet weak var cartIconBtn: UIButton! { didSet {
        cartIconBtn.tintColor = ColorManager.color.orange
    }}
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet var containerView: UIView! { didSet {
        containerView.backgroundColor = ColorManager.color.background
    }}
    @IBOutlet weak var imageBackground: UIImageView! { didSet {
        imageBackground.image = UIImage(named: "detailBackgrnd")
        imageBackground.alpha = 0.07
    }}
    @IBOutlet weak var titleDetail: UILabel! { didSet {
        titleDetail.applyStyle(.titleSmall)
    }}
    @IBOutlet weak var priceDetail: UILabel! { didSet {
        priceDetail.applyStyle(.subtitle)
        priceDetail.textColor = ColorManager.color.lightOrange
    }}
    @IBOutlet weak var titleDescriptionDetail: UILabel! { didSet {
        titleDescriptionDetail.applyStyle(.titleSmall)
        titleDescriptionDetail.text = TextManager.shared.descriptionTitle
    }}
    @IBOutlet weak var labelCategory: UILabel! { didSet {
        labelCategory.applyStyle(.body)
    }}
    @IBOutlet weak var descriptionDetail: UILabel! { didSet {
        descriptionDetail.applyStyle(.body)
    }}
    @IBOutlet weak var totalLabel: UILabel! { didSet {
        totalLabel.text = TextManager.shared.totalText
        totalLabel.applyStyle(.body)
    }}
    @IBOutlet weak var totalPriceLabel: UILabel! { didSet {
        totalPriceLabel.applyStyle(.body)
    }}
    @IBOutlet weak var barTitle: UILabel! { didSet{
        barTitle.text = TextManager.shared.productDetailsTitle
        barTitle.applyStyle(.subtitle)
    }}
    @IBOutlet weak var containerStepper: UIView!
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
        presenter?.loadProductDetails()
        NotificationCenter.default.addObserver(self, selector: #selector(handleCartUpdate), name: .cartDidUpdate, object: nil)
        presenter?.loadCartState()
    }
    
    @objc private func handleCartUpdate() {
        presenter?.loadCartState()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .cartDidUpdate, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCartButton()
        presenter?.loadCartState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadCartState()
    }
    // MARK: - UI Setup
    private func setupUI() {
        configureContainerViews()
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
        labelCategory.text = "Categoría: \(product.category)"
        titleDetail.text = product.name
        priceDetail.text = String(format: "S/ %.2f", product.price)
        descriptionDetail.text = product.description
        if let url = URL(string: product.imageUrl) {
            imageDetail.kf.setImage(with: url)
        }
        updateTotalPriceLabel(with: Double(digitData) * product.price)
    }
    
    func updateTotalPriceLabel(with totalPrice: Double) {
        totalPriceLabel.text = String(format: "S/ %.2f", totalPrice)
    }
    
    private func updateStepper() {
        labelUnity.text = "\(digitData)"
        presenter?.updateTotalPrice(for: digitData)
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
    
    @IBAction func addCartBtnTapped(_ sender: Any) {
        presenter?.addProductToCart(quantity: digitData)
        isItemSelected = true
        presenter?.saveCartState(isItemSelected: isItemSelected)
        configureCartButton()
        
        containerStepper.backgroundColor = ColorManager.color.customgray
        plusButton.isEnabled = false
        minusButton.isEnabled = false
        addCartBtn.isEnabled = false
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configurations
    private func configureDescriptionDetail() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.lineSpacing = 2.0
        paragraphStyle.paragraphSpacing = 5.0
        paragraphStyle.hyphenationFactor = 1.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .foregroundColor: ColorManager.color.offWhite
        ]
        
        descriptionDetail.attributedText = NSAttributedString(string: descriptionDetail.text ?? "", attributes: attributes)
        descriptionDetail.textAlignment = .justified
    }
    
    private func configureContainerViews() {
        containerView2.layer.cornerRadius = 30
        containerStepper.layer.cornerRadius = containerStepper.frame.size.height / 2
    }

    private func configureCartButton() {
        addCartBtn.setButtonStyle(isItemSelected ? .gray : .orangeGradient)
        labelButton.text = isItemSelected ? TextManager.shared.addedToCartButtonTitle : TextManager.shared.addToCartButtonTitle
        labelButton.applyStyle(.subtitle)
        addCartBtn.isEnabled = !isItemSelected
        containerStepper.backgroundColor = isItemSelected ? ColorManager.color.customgray : ColorManager.color.offWhite
    }
    
    func updateCartButtonState(isItemSelected: Bool) {
        print("DetailViewController: Updating cart button state to \(isItemSelected)")
        self.isItemSelected = isItemSelected
        configureCartButton()
        if isItemSelected {
            containerStepper.backgroundColor = ColorManager.color.customgray
            plusButton.isEnabled = false
            minusButton.isEnabled = false
            addCartBtn.isEnabled = false
        } else {
            containerStepper.backgroundColor = ColorManager.color.offWhite
            plusButton.isEnabled = true
            minusButton.isEnabled = true
            addCartBtn.isEnabled = true
        }
    }
}

extension Notification.Name {
    static let cartDidUpdate = Notification.Name("cartDidUpdate")
}
