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
    func displayError(_ message: String)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
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
        setupLabels()
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
        let buttonTitles = ["Todos", "Figura de Accion", "Clothes", "Manga", "Categoría 4"]
        for (index, label) in labelCollectionCategories.enumerated() where index < buttonCategories.count {
            label.text = buttonTitles[index]
            label.font = UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)
            buttonCategories[index].setButtonStyle(.gray)
        }
    }
    
    private func setupLabels() {
        labelTitle.text = "AnimeShop"
        labelTitle.applyStyle(.title)
        labelCategories.text = "Categorias"
        labelCategories.applyStyle(.body)
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
            button.setButtonStyle(isSelected ? .gradient : .gray)
            labelCollectionCategories[index].textColor = isSelected ? .black : .gray
        }
    }
    func displayProducts(_ products: [Product]) {
        self.products = products
        homeCollectionView.collectionViewLayout.invalidateLayout() // Asegura que el layout se actualice
        homeCollectionView.reloadData()
    }
    
    func displayError(_ message: String) {
        // Mostrar algún tipo de alerta o vista de error
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
        // Reinicia la selección de categorías a "ALL"
        if let allButton = buttonCategories.first(where: { labelCollectionCategories[buttonCategories.firstIndex(of: $0)!].text == "ALL" }) {
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
        self.layer.borderColor = UIColor(hex: "#04160F").cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.searchBarStyle = .minimal
        self.searchTextField.borderStyle = .none
        self.searchTextField.font = UIFont(name: "Avenir-Light", size: 16)
        self.searchTextField.textColor = .black
        self.searchTextField.backgroundColor = .white
        self.searchTextField.attributedPlaceholder = NSAttributedString(string: "Buscar por nombre...", attributes: [.foregroundColor: UIColor(hex: "#04160F")])
    }
}
