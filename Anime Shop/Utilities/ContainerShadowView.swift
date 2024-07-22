//
//  ContainerShadowView.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

extension UIView {
    func setupShadowHex(cornerRadius: CGFloat = 20,
                     shadowColorHex: String,
                     shadowOpacity: Float = 1,
                     shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0),
                     shadowRadius: CGFloat = 5) {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(hex: shadowColorHex).cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        // containerView.setupShadowHex(shadowColorHex: "#7E92DE")
    }
//    func setupShadowHex(cornerRadius: CGFloat = 20,
//                            shadowColorHex: String,
//                            shadowOpacity: Float = 1,
//                            shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0),
//                            shadowRadius: CGFloat = 5,
//                            addBlur: Bool = false) {
//            self.backgroundColor = .clear
//            self.layer.cornerRadius = cornerRadius
//            self.layer.masksToBounds = false
//            self.layer.shadowColor = UIColor(hex: shadowColorHex).cgColor
//            self.layer.shadowOpacity = shadowOpacity
//            self.layer.shadowOffset = shadowOffset
//            self.layer.shadowRadius = shadowRadius
//            
//            if addBlur {
//                let blurEffect = UIBlurEffect(style: .regular)
//                let blurEffectView = UIVisualEffectView(effect: blurEffect)
//                blurEffectView.frame = self.bounds
//                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                blurEffectView.layer.cornerRadius = cornerRadius
//                blurEffectView.clipsToBounds = true
//                self.insertSubview(blurEffectView, at: 0)
//            }
//        }
    
    func setupShadow(cornerRadius: CGFloat = 20,
                         shadowColor: UIColor = .black,
                         shadowOpacity: Float = 1,
                         shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0),
                         shadowRadius: CGFloat = 5) {
            self.backgroundColor = UIColor.white
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = false
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
        // containerView.setupShadow(shadowColor: .black)
        }

}
