//
//  UIColor+Extension.swift
//  AverageColor
//
//  Created by Maksym Yevtukhivskyi on 07.02.2024.
//

import UIKit

extension UIColor {
    /// Create a darker color
    func darker(by percentage: CGFloat = 40) -> UIColor {
        return adjustBrightness(by: -abs(percentage))
    }
    
    /// Try to increase brightness or decrease saturation
    private func adjustBrightness(by percentage: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            if brightness < 1.0 {
                let newBrightness: CGFloat = max(min(brightness + (percentage / 100.0) * brightness, 1.0), 0.0)
                return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
            } else {
                let newSaturation: CGFloat = min(max(saturation - (percentage / 100.0) * saturation, 0.0), 1.0)
                return UIColor(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
            }
        }
        
        return self
    }
}
