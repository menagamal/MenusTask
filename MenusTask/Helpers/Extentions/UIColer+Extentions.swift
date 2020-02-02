//
//  UIColer+Extentions.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
  convenience init(hexString: String) {
         let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
         var int = UInt32()
         Scanner(string: hex).scanHexInt32(&int)
         let a, r, g, b: UInt32
         switch hex.count {
         case 3: // RGB (12-bit)
             (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
         case 6: // RGB (24-bit)
             (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
         case 8: // ARGB (32-bit)
             (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
         default:
             (a, r, g, b) = (255, 0, 0, 0)
         }
         self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
     }
    //static let successColor = UIColor.init(red: 235/255, green: 73/255, blue: 24/255, alpha: 1)
    static let Navigation = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    static let connectionColor = UIColor(red: 17/255, green: 165/255, blue: 191/255, alpha: 1)
    static let noConnectionColor = UIColor(red: 235/255, green: 73/255, blue: 24/255, alpha: 1)
    static let mainColor = UIColor.init(rgb: 0xAF4747)
    static let blackColor = UIColor.init(rgb: 0x454F63)
    static let selectedColor = UIColor.init(rgb: 0x81B9AE)
    static let secondColor = UIColor.init(rgb: 0x81A9B9)
    static let DarkGray = UIColor.init(rgb: 0xA09B9B)
    static let LightGray = UIColor.init(rgb: 0xA6A6A6)
    //1D1F20
}
