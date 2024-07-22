//
//  ButtonStyles.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//
//

import UIKit

struct ButtonStyle {
    var backgroundColor: UIColor
    var gradientColors: [CGColor]?
    var borderColor: UIColor
    var borderWidth: CGFloat
    
    static let blueGradient = ButtonStyle(
        backgroundColor: .clear,
        gradientColors: [UIColor(hex: "E2BAF1").cgColor, UIColor(hex: "9198ff").cgColor],
        borderColor: .blue,
        borderWidth: 0
    )
    
    static let gray = ButtonStyle(
        backgroundColor: UIColor(hex: "3B3A50"),
        gradientColors: nil,
        borderColor: .clear,
        borderWidth: 0
    )
    
    static let orangeGradient = ButtonStyle(
        backgroundColor: .clear,
        gradientColors: [ColorManager.color.orange.cgColor, ColorManager.color.lightOrange.cgColor],
        borderColor: .blue,
        borderWidth: 0
    )
}

import UIKit

extension UIButton {
    
    func configure(title: String, titleFont: UIFont, titleColor: UIColor, style: ButtonStyle, isEnabled: Bool) {
        self.isEnabled = isEnabled
        self.setButtonStyle(style)
        let attributedTitle = NSAttributedString(string: title, attributes: [
            .font: titleFont,
            .foregroundColor: titleColor
        ])
        self.setAttributedTitle(attributedTitle, for: .normal)
        self.titleLabel?.font = titleFont
    }
    // Estilos de boton
    func setButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.backgroundColor
        layer.borderColor = style.borderColor.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        
        // Elimina cualquier gradiente existente
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        
        if let gradientColors = style.gradientColors {
            applyGradient(colors: gradientColors)
        }
    }
    
    // Button gradiente
    func applyGradient(colors: [CGColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 1), endPoint: CGPoint = CGPoint(x: 0.5, y: 0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        // Elimina cualquier gradiente existente
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Actualiza el frame del gradiente cuando el botón cambia de tamaño
    func updateGradientFrame() {
        layer.sublayers?.forEach { sublayer in
            if let gradient = sublayer as? CAGradientLayer {
                gradient.frame = bounds
            }
        }
    }
    
    // Método genérico para configurar el botón con un título y colores de gradiente
    func configureButton(title: String, titleFont: UIFont, titleColor: UIColor, gradientColors: [CGColor]) {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        applyGradient(colors: gradientColors)
        setAttributedTitle(NSAttributedString(string: title, attributes: [
            .font: titleFont,
            .foregroundColor: titleColor
        ]), for: .normal)
    }
    
    // Boton Apple
    func setupAppleButton() {
        configureButton(
            title: "Acceder con Apple",
            titleFont: UIFont(name: "Avenir-Medium", size: 16)!,
            titleColor: .white,
            gradientColors: [UIColor(hex: "#7A8189").cgColor, UIColor.black.cgColor]
        )
    }
    
    // Boton Google
    
    func setupGoogleButton() {
        configureButton(
            title: "Acceder con Google",
            titleFont: UIFont(name: "Avenir-Medium", size: 16)!,
            titleColor: .white,
            gradientColors: [UIColor(hex: "#8DACF4").cgColor, UIColor(hex: "#6AC0FD").cgColor]
        )
    }
}
