//
//  CustomTabbarController.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//
//
//import UIKit
//
//class CustomTabBarController: UIViewController {
//
//    var selectedIndex: Int = 0
//    var previousIndex: Int = 0
//    var viewControllers = [UIViewController]()
//    
//    @IBOutlet var buttons:[UIButton]!
//    @IBOutlet var tabView:UIView!
//    var footerHeight: CGFloat = 50
//    var tabViewHeightConstraint: NSLayoutConstraint!
//    
//    static let firstVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
//    static let thirdVC = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartViewController")
//    static let fourthVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewControllers.append(CustomTabBarController.firstVC)
//        viewControllers.append(CustomTabBarController.thirdVC)
//        viewControllers.append(CustomTabBarController.fourthVC)
//        
//        tabView.translatesAutoresizingMaskIntoConstraints = false
//        tabViewHeightConstraint = tabView.heightAnchor.constraint(equalToConstant: 60)
//        tabViewHeightConstraint.isActive = true
//        
//        edgesForExtendedLayout = []
//        extendedLayoutIncludesOpaqueBars = true
//       
//        addBlurEffect()
//        setupShadow()
//        configureButtons()
//        
//        tabChanged(sender: buttons[selectedIndex])
//    }
//    
//    
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//    }
//    
//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//            self.view.bringSubviewToFront(tabView)
////            setupShadow()
//        }
//    private func setupShadow() {
//        tabView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
//        tabView.layer.cornerRadius = tabView.frame.height / 2
//        tabView.layer.masksToBounds = false
//        tabView.layer.shadowColor = UIColor(hex: "#7E92DE").cgColor
//        tabView.layer.shadowOpacity = 0.8
//        tabView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
//        tabView.layer.shadowRadius = 15
//       
//        }
//    private func addBlurEffect() {
//            let blurEffect = UIBlurEffect(style: .regular)
//            let blurEffectView = UIVisualEffectView(effect: blurEffect)
//            blurEffectView.frame = tabView.bounds
//            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            blurEffectView.layer.cornerRadius = blurEffectView.frame.height / 2
//            blurEffectView.clipsToBounds = true
//            tabView.addSubview(blurEffectView)
//            tabView.sendSubviewToBack(blurEffectView)
//        
//        
//        }
//    
//    private func configureButtons() {
//        buttons[0].setImage(UIImage(systemName: "house"), for: .normal)
//        buttons[0].setImage(UIImage(systemName: "house.fill"), for: .selected)
//        
//        buttons[1].setImage(UIImage(systemName: "heart"), for: .normal)
//        buttons[1].setImage(UIImage(systemName: "heart.fill"), for: .selected)
//        
//        buttons[2].setImage(UIImage(systemName: "cart"), for: .normal)
//        buttons[2].setImage(UIImage(systemName: "cart.fill"), for: .selected)
//        buttons[selectedIndex].isSelected = true
//        
//    }
//}
//
//// MARK: - Actions
//extension CustomTabBarController {
//    
//    @IBAction func tabChanged(sender:UIButton) {
//        previousIndex = selectedIndex
//        selectedIndex = sender.tag
//        
//        buttons[previousIndex].isSelected = false
//        sender.isSelected = true
//        
//        let previousVC = viewControllers[previousIndex]
//        previousVC.willMove(toParent: nil)
//        previousVC.view.removeFromSuperview()
//        previousVC.removeFromParent()
//        
//        
//        let vc = viewControllers[selectedIndex]
//        vc.view.frame = UIApplication.shared.windows[0].frame
//        vc.didMove(toParent: self)
//        self.addChild(vc)
//        self.view.addSubview(vc.view)
//        
//        self.view.bringSubviewToFront(tabView)
//        animateButtonBounce(sender)
//    }
//// añadir manager de animaciones
//    func animateButtonBounce(_ button: UIButton) {
//            let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
//            bounceAnimation.values = [1.0, 1.3, 0.8, 1.15, 0.9, 1.0]
//            bounceAnimation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1.0]
//            bounceAnimation.duration = 0.8
//
//            button.layer.add(bounceAnimation, forKey: "bounce")
//        }
//}
//

import UIKit

class CustomTabBarController: UIViewController {

    enum Tab: Int {
        case home = 0
        case cart
        case profile
    }

    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    var viewControllers = [UIViewController]()
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var tabView: UIView!
    var tabViewHeightConstraint: NSLayoutConstraint!
    
    static let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
    static let cartVC = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartViewController")
    static let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [CustomTabBarController.homeVC, CustomTabBarController.cartVC, CustomTabBarController.profileVC]
        
        configureTabView()
        addBlurEffect()
        setupShadow()
        configureButtons()
        
        selectTab(at: selectedIndex)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.bringSubviewToFront(tabView)
    }
    
    private func configureTabView() {
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabViewHeightConstraint = tabView.heightAnchor.constraint(equalToConstant: 60)
        tabViewHeightConstraint.isActive = true
    }
    
    private func setupShadow() {
        tabView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        tabView.layer.cornerRadius = tabView.frame.height / 2
        tabView.layer.masksToBounds = false
        tabView.layer.shadowColor = UIColor(hex: "#7E92DE").cgColor
        tabView.layer.shadowOpacity = 0.8
        tabView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        tabView.layer.shadowRadius = 15
    }

    private func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tabView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = blurEffectView.frame.height / 2
        blurEffectView.clipsToBounds = true
        tabView.addSubview(blurEffectView)
        tabView.sendSubviewToBack(blurEffectView)
    }
    
    private func configureButtons() {
        let buttonImages: [(normal: String, selected: String)] = [
            ("house", "house.fill"),
            ("cart", "cart.fill"),
            ("person", "person.fill")
        ]
        
        for (index, button) in buttons.enumerated() {
            let images = buttonImages[index]
            button.setImage(UIImage(systemName: images.normal), for: .normal)
            button.setImage(UIImage(systemName: images.selected), for: .selected)
            button.tag = index
        }
        
        buttons[selectedIndex].isSelected = true
    }
    
    private func selectTab(at index: Int) {
        previousIndex = selectedIndex
        selectedIndex = index
        
        buttons[previousIndex].isSelected = false
        buttons[selectedIndex].isSelected = true
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        vc.view.frame = view.bounds
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        view.bringSubviewToFront(tabView)
    }
    
    @IBAction func tabChanged(sender: UIButton) {
        guard sender.tag != selectedIndex else { return }
        selectTab(at: sender.tag)
        animateButtonBounce(sender)
    }

    func animateButtonBounce(_ button: UIButton) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.3, 0.8, 1.15, 0.9, 1.0]
        bounceAnimation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1.0]
        bounceAnimation.duration = 0.8
        button.layer.add(bounceAnimation, forKey: "bounce")
    }
}
