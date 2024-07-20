//
//  ViewController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 19/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.presentHomeViewController()
                }
    }

    func presentHomeViewController() {
            // Crea una instancia del storyboard que contiene HomeViewController
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            
            // Crea una instancia de HomeViewController usando su identificador
            if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                // Presenta HomeViewController
                homeViewController.modalPresentationStyle = .fullScreen
                self.present(homeViewController, animated: true, completion: nil)
            }
        }

}

