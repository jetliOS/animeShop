//
//  DetailViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

protocol DetailViewProtocol: AnyObject {}

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
    
    // MARK: - Properties
    var presenter: DetailViewPresenterProtocol?
    let configurator = DetailViewConfigurator()
    var digitData: Int = 1
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewcontroller: self)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        barTitle.text = "Detalles de producto"
        barTitle.applyStyle(.title)
        setupButtons()
        configureDescriptionDetail()
    }
    
    private func setupButtons() {
        [minusButton, plusButton].forEach {
            $0.layer.cornerRadius = 3
            $0.backgroundColor = UIColor(hex: "3752A3").withAlphaComponent(0.1)
            $0.layer.borderColor = UIColor(hex: "3752A3").withAlphaComponent(0.4).cgColor
            $0.layer.borderWidth = 1
        }
    }

    // MARK: - Actions
    @IBAction func minusButtonAction(_ sender: UIButton) {
        if digitData > 1 {
            digitData -= 1
            updateStepper()
        }
    }
    
    @IBAction func plusButtonAction(_ sender: UIButton) {
        if digitData < 10 {
            digitData += 1
            updateStepper()
        }
    }
    
    private func updateStepper() {
        labelUnity.text = "\(digitData)"
    }
    
    @IBAction func addCartAction(_ sender: Any) {
        // Implementation needed
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
}

    
    


