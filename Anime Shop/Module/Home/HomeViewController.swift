//
//  HomeView.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//
import UIKit
import FirebaseFirestore

protocol HomeViewProtocol: AnyObject {
    func displayProducts(_ products: [Product])
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet var containerView: UIView! { didSet {
        containerView.backgroundColor = ColorManager.color.darkBackground
    }}
    @IBOutlet weak var imageBackground: UIImageView! { didSet {
        imageBackground.image = UIImage(named: "backgroundHome")
        imageBackground.alpha = 1
    }}
    @IBOutlet weak var labelTitle: UILabel! { didSet {
        labelTitle.attributedText = TextManager.shared.attributedWelcomeText()
}}
    @IBOutlet weak var labelCategories: UILabel! { didSet {
        labelCategories.text = TextManager.shared.categoriesLabelText
        labelCategories.applyStyle(.subtitle)
        labelCategories.textColor = .white
    }}
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var buttonCategories: [UIButton]!
    @IBOutlet var labelCollectionCategories: [UILabel]!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: HomeViewPresenterProtocol?
    let configurator = HomeViewConfigurator()
    var products: [Product] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewcontroller: self)
        setupUI()
        registerCollectionViewCells()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        setupButtonTitles()
        setupSearchBar()
        presenter?.fetchProducts()
    }
    
    private func registerCollectionViewCells() {
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func setupButtonTitles() {
        let buttonTitles = TextManager.shared.categoryButtonTitles
        for (index, label) in labelCollectionCategories.enumerated() where index < buttonCategories.count {
            label.text = buttonTitles[index]
            label.textColor = ColorManager.color.offWhite
            label.font = UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)
            buttonCategories[index].setButtonStyle(.gray)
           
        }
    }
    
    private func setupSearchBar() {
        searchBar.customizeAppearance()
    }
    
    // MARK: - Actions
    @IBAction func buttonCategoryTapped(_ sender: UIButton) {
        searchBar.text = ""
        updateButtonSelectionStates(for: sender)
        if let index = buttonCategories.firstIndex(of: sender) {
            let selectedCategory = labelCollectionCategories[index].text
            presenter?.filterProducts(byCategory: selectedCategory)
        }
    }
    
    func updateButtonSelectionStates(for selectedButton: UIButton) {
        for (index, button) in buttonCategories.enumerated() {
            let isSelected = button == selectedButton
            button.setButtonStyle(isSelected ? .orangeGradient : .gray)
            labelCollectionCategories[index].textColor = isSelected ? ColorManager.color.offWhite : ColorManager.color.offWhite
        }
    }
    
    func displayProducts(_ products: [Product]) {
        self.products = products
        homeCollectionView.collectionViewLayout.invalidateLayout()
        homeCollectionView.reloadData()
    }
}

// MARK: - UICollectionView Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 50) * 0.5, height: (view.frame.width) * 0.57)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        presenter?.goToDetail(with: selectedProduct)
    }
}

// MARK: - UISearchBar Delegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let allButton = buttonCategories.first(where: { labelCollectionCategories[buttonCategories.firstIndex(of: $0)!].text == "Todos" }) {
            updateButtonSelectionStates(for: allButton)
        }
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(filterContentForSearchText(_:)), object: searchBar)
        perform(#selector(filterContentForSearchText(_:)), with: searchBar, afterDelay: 0.5)
    }
    
    @objc private func filterContentForSearchText(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        presenter?.filterProducts(bySearchText: searchText)
    }
}

// MARK: - UISearchBar Customization
extension UISearchBar {
    func customizeAppearance() {
        self.layer.borderColor = ColorManager.color.offWhite.cgColor
        self.layer.backgroundColor = ColorManager.color.background.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.searchBarStyle = .minimal
        
        guard let searchTextField = self.value(forKey: "searchField") as? UITextField else { return }
        
        searchTextField.borderStyle = .none
        searchTextField.font = UIFont(name: "Avenir-Medium", size: 16)
        searchTextField.textColor = ColorManager.color.offWhite
//        searchTextField.backgroundColor = UIColor(hex: "#1C1B30")
        searchTextField.attributedPlaceholder = NSAttributedString(string: TextManager.shared.searchBarPlaceholderText, attributes: [.foregroundColor: UIColor(hex: "#F4F4F4")])
        
        guard let leftView = searchTextField.leftView as? UIImageView else { return }
        leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
        leftView.tintColor = ColorManager.color.offWhite
    }
}
