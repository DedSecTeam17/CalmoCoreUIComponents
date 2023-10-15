//
//  File.swift
//  
//
//  Created by Mohammed Elamin on 14/10/2023.
//

import Foundation
import SwiftUI




protocol ColorPlate{
    var  primaryColor:Color {get set}
    var  backgroundColor:Color {get set}
    var  secondaryColor:Color {get set}
    var  lightBackgroundColor:Color {get set}
    var  iconColor:Color {get set}

}

struct LightColorPlate : ColorPlate{
    var primaryColor: Color = Color(hex: "#fe6601")
    
    var backgroundColor: Color = Color(hex: "#EFF3F5")
    
    var secondaryColor: Color = Color(hex: "#4030FF")
    
    var lightBackgroundColor: Color = .white
    
    var iconColor: Color = .white
    
    
}

struct DarkColorPlate : ColorPlate{
    var primaryColor: Color = Color(hex: "#fe6601")
    
    var backgroundColor: Color = .black
    
    var secondaryColor: Color = Color(hex: "#4030FF")
    
    var lightBackgroundColor: Color = .black.opacity(0.9)
    
    var iconColor: Color = .black
    
    
}


struct Theme {
    let primaryColor: Color
    let backgroundColor : Color
    let secondaryColor: Color
    let iconColor: Color

    // Add any other theme attributes you want
}


let lightTheme = Theme(
    primaryColor: Color(hex: "#fe6601"),
    backgroundColor : Color(hex: "#EFF3F5"),
    secondaryColor: .black,
    iconColor: .black
)



let darkTheme = Theme(
    primaryColor: Color(hex: "#4030FF"),
    backgroundColor : Color(hex: "#EFF3F5"),
    secondaryColor: .black,
    iconColor: .white

)


struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = darkTheme  // Default theme
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}









// color extenstion
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

