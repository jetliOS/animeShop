//
//  ButtonStyles.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

struct ButtonStyle {
    var backgroundColor: UIColor
    var gradientColors: [CGColor]?
    var borderColor: UIColor
    var borderWidth: CGFloat

    static let gradient = ButtonStyle(
        backgroundColor: .clear,
        gradientColors: [UIColor(hex: "E2BAF1").cgColor, UIColor(hex: "989DEF").cgColor],
        borderColor: .blue,
        borderWidth: 0
    )

    static let gray = ButtonStyle(
        backgroundColor: UIColor(hex: "EFEEF2"),
        gradientColors: nil,
        borderColor: .clear,
        borderWidth: 0
    )
}

extension UIButton {
    func setButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.backgroundColor
        layer.borderColor = style.borderColor.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }

        if let gradientColors = style.gradientColors {
            applyGradient(colors: gradientColors)
        } else {
            layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        }
    }

    private func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
