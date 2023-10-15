//
//  SwiftUIView.swift
//  
//
//  Created by Mohammed Elamin on 14/10/2023.
//

import SwiftUI

public struct CalmoPrimaryButton: View {
    var text:String
    var size:CGSize = .init(width: 0.0, height: 0.0)
    var onTap:()->Void
    
    init(text: String, size: CGSize = .init(width: 0.0, height: 0.0), onTap: @escaping () -> Void) {
        self.text = text
        self.size = size
        self.onTap = onTap
    }
    
    public var body: some View {
        CalmoButton(calmoButtonConfig: .init(buttonContent: {
            Text(text)
                .font(CalmoFontVarient.body.font)
                .foregroundColor(.white)
                .padding(.all)
        },buttonHeigth: size.height, buttonWidth: size.width, withColor: true,borderRadius: 16, onTap: {
            onTap()
            
        }))
    }
}

#Preview {
    CalmoPrimaryButton(text: "Save Me") {
        print("CLICKED...")
    }
}
