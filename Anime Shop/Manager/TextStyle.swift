//
//  TextStyles.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 20/07/24.
//

import UIKit

// Estructura para manejar los estilos de texto
struct TextStyle {
    let font: UIFont
    let color: UIColor
    let alignment: NSTextAlignment

    static let title = TextStyle(font: UIFont(name: "Avenir-Heavy", size: 24) ?? UIFont.boldSystemFont(ofSize: 24), color: UIColor(hex: "#04160F"), alignment: .left)
    static let titleSmall = TextStyle(font: UIFont(name: "Avenir-Heavy", size: 20) ?? UIFont.boldSystemFont(ofSize: 24), color: UIColor(hex: "#04160F"), alignment: .left)
    static let subtitle = TextStyle(font: UIFont(name: "Avenir-Medium", size: 16) ?? UIFont.systemFont(ofSize: 14), color: UIColor(hex: "#04160F"), alignment: .left)
    static let body = TextStyle(font: UIFont(name: "Avenir-Light", size: 14) ?? UIFont.systemFont(ofSize: 12), color: UIColor(hex: "#374259"), alignment: .left)
    static let button = TextStyle(font: UIFont(name: "Avenir-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18), color: .white, alignment: .center)
}

// Extensión de UILabel para aplicar los estilos de texto
extension UILabel {
    func applyStyle(_ style: TextStyle) {
        self.font = style.font
        self.textColor = style.color
        self.textAlignment = style.alignment
    }
}

// Extensión de UIButton para aplicar los estilos de texto
extension UIButton {
    func applyStyle(_ style: TextStyle, backgroundColor: UIColor) {
        self.titleLabel?.font = style.font
        self.setTitleColor(style.color, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = self.frame.height / 2
    }
}
