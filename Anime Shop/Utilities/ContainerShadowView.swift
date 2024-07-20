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
