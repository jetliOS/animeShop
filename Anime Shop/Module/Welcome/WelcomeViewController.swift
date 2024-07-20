//
//  ViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presentHomeViewController()
        }
    }

    func presentHomeViewController() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

