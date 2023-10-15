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
    
    
    public var font: Font {
        switch self {
        case .largeTitle:
            return CalmoFont.shared.largeTitle
        case .title1:
            return CalmoFont.shared.title1
        case .title2:
            return CalmoFont.shared.title2
        case .title3:
            return CalmoFont.shared.title3
        case .headline:
            return CalmoFont.shared.headline
        case .body:
            return CalmoFont.shared.body
        case .callout:
            return CalmoFont.shared.callout
        case .subHead:
            return CalmoFont.shared.subHead
        case .footNote:
            return CalmoFont.shared.footNote
        case .caption1:
            return CalmoFont.shared.caption1
            
        case .caption2:
            return CalmoFont.shared.caption2
            
        }
    }
    
    
    
}

class CalmoFont {
    
    
    static let shared = CalmoFont()
      
      private init() {
          loadFont(name: "YoungSerif-Regular", type: "ttf", bundle: Bundle.module)
          loadFont(name: "NotoSans-Regular", type: "ttf", bundle: Bundle.module)
          loadFont(name: "NotoSans-SemiBold", type: "ttf", bundle: Bundle.module)
          
      }
    

    
     var largeTitle: Font {
        return Font.custom("NotoSans-Regular", size: 34).weight(.bold)
    }
     var title1: Font {
        return Font.custom("NotoSans-Regular", size: 28).weight(.bold)
    }
     var title2: Font {
        return Font.custom("NotoSans-Regular", size: 22).weight(.bold)
    }
     var title3: Font {
        return Font.custom("NotoSans-Regular", size: 20).weight(.regular)
    }
     var headline: Font {
        return Font.custom("NotoSans-SemiBold", size: 17).weight(.semibold)
    }
     var body: Font {
        return Font.custom("NotoSans-Regular", size: 17).weight(.regular)
    }
    
     var callout: Font {
        return Font.custom("NotoSans-Regular", size: 16).weight(.regular)
    }
     var subHead: Font {
        return Font.custom("NotoSans-Regular", size: 15).weight(.regular)
    }
     var footNote: Font {
        return Font.custom("NotoSans-Regular", size: 13).weight(.regular)
    }
     var caption1: Font {
        return Font.custom("NotoSans-Regular", size: 12).weight(.regular)
    }
     var caption2: Font {
        return Font.custom("NotoSans-Regular", size: 11).weight(.regular)
    }

    
}


extension CalmoFont {
    private  func loadFont(name: String, type: String, bundle: Bundle) {
        print("LOADING FROM SINGLETON... \(name)")

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
