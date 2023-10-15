//
//  SwiftUIView.swift
//  
//
//  Created by Mohammed Elamin on 14/10/2023.
//

import SwiftUI

public struct CalmoTextButton: View {
    @Environment(\.theme) var theme

    
    var text:String
    var onTap:()->Void
    
   public init(text: String, onTap: @escaping () -> Void) {
        self.text = text
        self.onTap = onTap
    }
    
    public var body: some View {
        CalmoButton(calmoButtonConfig: .init(buttonContent: {
            Text(text)
                .font(CalmoFontVarient.body.font)
                .foregroundColor(theme.primaryColor)
    
        },withColor: false, onTap: {
            onTap()
        }))
    }
}

#Preview {
    CalmoTextButton(text: "Save Me") {
        print("CLICKED...")
    }
}
