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
    let addToCartButtonTitle = "Añadir al carrito"
    let addedToCartButtonTitle = "Añadido al carrito"
    let signIn = "¡Accede!"
    let signUp = "¡Registrate!"

    // Fonts
    let buttonTitleFont = UIFont(name: "Avenir-Heavy", size: 18)!
    let textFieldFont = UIFont(name: "Avenir-Medium", size: 16)
    
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
    let productDetailsTitle = "Detalles de producto"
    let descriptionTitle = "Descripción"
    let categoryLabelText = "Categoría:"
    let createAccount = "Crea tu cuenta"
    let yaTienesCuenta = "¿Ya tienes cuenta?"
    let aunNoTienesCuenta = "¿Aún no tienes cuenta?"
    let password = "Contraseña"
    let user = "Usuario"
    
    // Categorías
    let categoryButtonTitles = ["Todos", "Figura de Accion", "Ropa", "Peluches", "Accesorios"]

    // Método para texto orange/blanco
    func attributedWelcomeText() -> NSAttributedString {
        let text = welcomeLabelText
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: UIFont(name: "Avenir-Heavy", size: 24)!, range: NSRange(location: 0, length: text.count))
        
        let animeRange = (text as NSString).range(of: "Anime")
        attributedString.addAttribute(.foregroundColor, value: ColorManager.color.orange, range: animeRange)
        
        let shopRange = (text as NSString).range(of: "Shop")
        attributedString.addAttribute(.foregroundColor, value: ColorManager.color.offWhite, range: shopRange)
        
        return attributedString
    }
}
