//
//  File.swift
//
//
//  Created by Mohammed Elamin on 13/10/2023.
//

import Foundation
import SwiftUI



public enum CalmoFontVarient  {
    
    
    
     case largeTitle , title1 , title2 , title3 , headline , body , callout , subHead  , footNote , caption1 ,caption2
    
    
    public var front: Font {
        switch self {
        case .largeTitle:
            return CalmoFont.largeTitle
        case .title1:
            return CalmoFont.title1
        case .title2:
            return CalmoFont.title2
        case .title3:
            return CalmoFont.title3
        case .headline:
            return CalmoFont.headline
        case .body:
            return CalmoFont.body
        case .callout:
            return CalmoFont.callout
        case .subHead:
            return CalmoFont.subHead
        case .footNote:
            return CalmoFont.footNote
        case .caption1:
            return CalmoFont.caption1
            
        case .caption2:
            return CalmoFont.caption2
            
        }
    }
    
    
    
}

class CalmoFont {
    
    
    
    
    static let _once: Void = {
        loadFont(name: "YoungSerif-Regular", type: "ttf", bundle: Bundle.module)
        loadFont(name: "NotoSans-Regular", type: "ttf", bundle: Bundle.module)
        loadFont(name: "NotoSans-SemiBold", type: "ttf", bundle: Bundle.module)
        
        
        // Load any other fonts here if needed
    }()
    
    
    //    static let customTitle = Font.custom("YourFontName-Bold", size: 24)
    static let customBody = Font.custom("YourFontName-Regular", size: 16)
    static let customCaption = Font.custom("YourFontName-Light", size: 12)
    
    
    
    static var largeTitle: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 34).weight(.bold)
    }
    static var title1: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 28).weight(.bold)
    }
    static var title2: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 22).weight(.bold)
    }
    static var title3: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 20).weight(.regular)
    }
    static var headline: Font {
        _ = CalmoFont._once  // This ensures the static14initializer runs once
        return Font.custom("NotoSans-SemiBold", size: 17).weight(.semibold)
    }
    static var body: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 17).weight(.regular)
    }
    
    static var callout: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 16).weight(.regular)
    }
    static var subHead: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 15).weight(.regular)
    }
    static var footNote: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 13).weight(.regular)
    }
    static var caption1: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 12).weight(.regular)
    }
    static var caption2: Font {
        _ = CalmoFont._once  // This ensures the static initializer runs once
        return Font.custom("NotoSans-Regular", size: 11).weight(.regular)
    }
    
    
    
    
    
    
}


extension CalmoFont {
    private static func loadFont(name: String, type: String, bundle: Bundle) {
        print("LOADING... \(name)")

        guard let fontURL = bundle.url(forResource: name, withExtension: type),
              let fontData = try? Data(contentsOf: fontURL),
              let fontDataProvider = CGDataProvider(data: fontData as CFData),
              let font = CGFont(fontDataProvider)
        else {
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Error registering font: \(error?.takeRetainedValue().localizedDescription ?? "")")
        }
    }
}
