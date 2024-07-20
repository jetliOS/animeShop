//
//  HomeView.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit

protocol HomeViewProtocol: AnyObject {}

class HomeViewController: UIViewController, HomeViewProtocol{
    
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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewcontroller: self)
        setupUI()
        registerCollectionViewCells()
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
    }
    
    private func registerCollectionViewCells() {
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nibName, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func setupButtonTitles() {
        for (index, label) in labelCollectionCategories.enumerated() where index < buttonCategories.count {
            label.text = ["Categoría 1", "Categoría 2", "Categoría 3", "Categoría 4"][index]
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
        updateButtonSelectionStates(for: sender)
    }
    
    func updateButtonSelectionStates(for selectedButton: UIButton) {
        for (index, button) in buttonCategories.enumerated() {
            let isSelected = button == selectedButton
            button.setButtonStyle(isSelected ? .gradient : .gray)
            labelCollectionCategories[index].textColor = isSelected ? .black : .gray
        }
    }
}

// MARK: - UICollectionView Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width * 0.4, height: view.frame.width * 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.goToDetail()
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
