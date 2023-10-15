//
//  SwiftUIView.swift
//  
//
//  Created by Mohammed Elamin on 15/10/2023.
//

import SwiftUI


public enum SecondaryButtonType{
    case bordered
    case underLine
}

public struct CalmoSecondaryButton: View {
    @Environment(\.theme) var theme
    
    var secondaryButtonType:SecondaryButtonType = .bordered
    
    var text:String
    var onTap:()->Void
    
    public init( secondaryButtonType: SecondaryButtonType = .bordered, text: String, onTap: @escaping () -> Void) {
        self.secondaryButtonType = secondaryButtonType
        self.text = text
        self.onTap = onTap
    }

    public var body: some View {
        CalmoButton(calmoButtonConfig: .init(buttonContent: {
            
            Text(text)
                .font(CalmoFontVarient.body.font)
                .foregroundColor(theme.primaryColor)
                .underline(secondaryButtonType == .underLine)
    
        },withColor: false, onTap: {
            onTap()
        }))
        .padding(.all)
        .background(RoundedRectangle(cornerRadius: 8)
            .stroke(secondaryButtonType == .bordered ? theme.primaryColor : .clear,lineWidth: 1)
        )

        
    }
    

}

#Preview {
    VStack(content: {
        CalmoSecondaryButton(secondaryButtonType: .bordered, text: "Click Me!", onTap: {
            
        })
        CalmoSecondaryButton(secondaryButtonType: .underLine, text: "Click Me!", onTap: {
            
        })
    })
}
