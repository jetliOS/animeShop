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
    static let subtitle = TextStyle(font: UIFont(name: "Avenir-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18), color: UIColor(hex: "#04160F"), alignment: .left)
    static let body = TextStyle(font: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16), color: UIColor(hex: "#04160F"), alignment: .left)
}

// Extensión de UILabel para aplicar los estilos de texto
extension UILabel {
    func applyStyle(_ style: TextStyle) {
        self.font = style.font
        self.textColor = style.color
        self.textAlignment = style.alignment
    }
}
