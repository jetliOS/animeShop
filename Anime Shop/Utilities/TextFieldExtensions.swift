//
//  TextFieldExtensions.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 22/07/24.
//

import UIKit

extension UITextField {
    func configure(placeholder: String, placeholderColor: UIColor, textColor: UIColor) {
        self.textColor = textColor
        let placeholderFont = TextManager.shared.textFieldFont ?? UIFont.systemFont(ofSize: 14)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: placeholderFont
        ]
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
    }
}
