//
//  TextManager.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

class TextManager {
    static let shared = TextManager()

    // Botones
    let loginButtonTitle = "Iniciar sesión"
    let registerButtonTitle = "Registrarse"
    let skipButtonTitle = "Omitir"
    let checkoutButtonTitle = "Checkout"

    // Colores
    let loginButtonGradientColors = [UIColor(hex: "#E2BAF1").cgColor, UIColor(hex: "#9198ff").cgColor]
    let registerButtonGradientColors = [UIColor(hex: "#E2BAF1").cgColor, UIColor(hex: "#9198ff").cgColor]
    let skipButtonGradientColors = [UIColor.gray.cgColor, UIColor.darkGray.cgColor]
    let buttonBackgroundColor = UIColor(hex: "#374259")

    let buttonTitleFont = UIFont(name: "Avenir-Medium", size: 18)!
    
    // Textos
    let welcomeLabelText = "AnimeShop"
    let categoriesLabelText = "Categorias"
    let searchBarPlaceholderText = "Buscar por nombre..."
    let loginWelcomeLabelText = "¡Bienvenido!"
    let loginButtonTitleText = "Iniciar sesión"
    let cartTitleText = "Carrito de compras"
    let cartSubtitleText = "Encuentra tus productos favoritos"
    let subtotalText = "Subtotal"
    let totalText = "TOTAL"

    // Categorías
    let categoryButtonTitles = ["Todos", "Figura de Accion", "Ropa", "Peluches", "Accesorios"]

    // Métodos adicionales para textos formateados, si es necesario
    // colocar en extension
    func attributedWelcomeText() -> NSAttributedString {
        let text = welcomeLabelText
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: UIFont(name: "Avenir-Heavy", size: 24)!, range: NSRange(location: 0, length: text.count))
        
        let animeRange = (text as NSString).range(of: "Anime")
        attributedString.addAttribute(.foregroundColor, value: UIColor(hex: "#535BE8"), range: animeRange)
        
        let shopRange = (text as NSString).range(of: "Shop")
        attributedString.addAttribute(.foregroundColor, value: UIColor(hex: "#0E0E2E"), range: shopRange)
        
        return attributedString
    }
}
