//
//  ProfielViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//
import UIKit


class ProfileViewController: UIViewController{
 
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView! { didSet {
        containerView.backgroundColor = ColorManager.color.background
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}
