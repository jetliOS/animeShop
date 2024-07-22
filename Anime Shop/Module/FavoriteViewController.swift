//
//  FavoriteViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

class FavoriteViewController: UIViewController{
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
//        configureCell()
    }
    
    
    private func configureCell(){
//        let nib = UINib(nibName: "FavoriteCell", bundle: nil)
//        favoriteCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
//        favoriteCollectionView.delegate = self
//        favoriteCollectionView.dataSource = self
    }
    private func configureLabels() {
        labelTitle.text = "Favoritos"
        labelTitle.font = UIFont(name: "Inter-SemiBold", size: 20)
        labelTitle.textColor = UIColor(hex: "#374259")
        labelText.text = "Encuentra tus productos favoritos"
        labelText.font = UIFont(name: "Inter-ExtraLight", size: 14)
        labelText.textColor = UIColor(hex: "#374259")
       
    }
   
}
