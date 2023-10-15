//
//  SwiftUIView.swift
//  
//
//  Created by Mohammed Elamin on 15/10/2023.
//

import SwiftUI



public enum TertiaryButtonType{
    case icon
    case iconWithText
    case underLine
}

public struct CalmoTertiaryButton: View {
    @Environment(\.theme) var theme

    var text:String = ""
    var imageName:String = ""
    var size:CGSize = .init(width: 0.0, height: 0.0)
    var tertiaryButtonType:TertiaryButtonType = .icon
    var onTap:()->Void
    
    
    
    public init( text: String = "", imageName: String = "", size: CGSize = .init(width: 0.0, height: 0.0), tertiaryButtonType: TertiaryButtonType = .icon, onTap: @escaping () -> Void) {
        self.text = text
        self.imageName = imageName
        self.size = size
        self.tertiaryButtonType = tertiaryButtonType
        self.onTap = onTap
    }
    
    public  var body: some View {
        if tertiaryButtonType == .iconWithText {
            IconWithTextButton()
        }else if tertiaryButtonType == .icon{
            IconButton()
        }
    }
    
    @ViewBuilder
    func IconButton() -> some View{
        CalmoButton(calmoButtonConfig: .init(buttonContent: {
            Image(imageName, bundle: .module)
                .renderingMode(.template)
                .foregroundColor(theme.iconColor)
                .frame(width: 24,height: 24)
                .padding(.all)

        },buttonHeigth: size.height, buttonWidth: size.width, withColor: true,borderRadius: 24, onTap: {
            onTap()
        }))
    }
    
    @ViewBuilder
    func IconWithTextButton() -> some View{
        CalmoButton(calmoButtonConfig: .init(buttonContent: {
            HStack(content: {
                Image(imageName, bundle: .module)
                    .renderingMode(.template)
                    .foregroundColor(theme.iconColor)
                    .frame(width: 24,height: 24)
                Text(text)
                    .font(CalmoFontVarient.body.font)
                    .foregroundColor(.white)
            }).padding(.all)

        },buttonHeigth: size.height, buttonWidth: size.width, withColor: true,borderRadius: 16, onTap: {
            onTap()
        }))
    }
    
    
}

#Preview {
    VStack(content: {
        CalmoTertiaryButton(text :"Continue with email",imageName: "message") {
            
        }
        CalmoTertiaryButton(text :"Continue with email",imageName: "message",tertiaryButtonType: .iconWithText) {
            
        }
    })
}
