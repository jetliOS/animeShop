//
//  LevitatingAnimation.swift
//  Anime Shop
//
//  Created by Jesus Herrera on 21/07/24.
//

import UIKit

extension UIView {
    func startLevitating() {
        let levitate = CABasicAnimation(keyPath: "position.y")
        levitate.fromValue = layer.position.y
        levitate.toValue = layer.position.y + 5
        levitate.duration = 2.0
        levitate.autoreverses = true
        levitate.repeatCount = .greatestFiniteMagnitude
        levitate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(levitate, forKey: "levitate")
    }
}
