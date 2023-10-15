//
//  SwiftUIView.swift
//
//
//  Created by Mohammed Elamin on 14/10/2023.
//

import SwiftUI


struct CalmoButtonConfig<Content:View>{
    var buttonContent:Content
    var buttonHeigth: CGFloat
    var buttonWidth: CGFloat

    var withColor: Bool
    var borderRadius: CGFloat
    var onTap:()->Void
    
    init(@ViewBuilder buttonContent: @escaping ()-> Content,
         buttonHeigth: CGFloat = 0,
         buttonWidth: CGFloat = 0,
         withColor: Bool = false,
         borderRadius: CGFloat = 16,
         onTap:@escaping ()->Void) {
        self.buttonContent = buttonContent()
        self.buttonHeigth = buttonHeigth
        self.buttonWidth = buttonWidth

        self.onTap = onTap
        self.withColor = withColor
        self.borderRadius = borderRadius
    }
}

struct CalmoButton<Content:View>: View {
    @Environment(\.theme) var theme
    
    
    var calmoButtonConfig:CalmoButtonConfig<Content>
    
    
    init(calmoButtonConfig: CalmoButtonConfig<Content>) {
        self.calmoButtonConfig = calmoButtonConfig
    }
    
    var body: some View {
        Button (action: {
            self.calmoButtonConfig.onTap()
        }){
            if calmoButtonConfig.withColor {
                if calmoButtonConfig.buttonWidth <= 0 || calmoButtonConfig.buttonHeigth <= 0 {
                    self.calmoButtonConfig
                        .buttonContent
                        .background(theme.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: calmoButtonConfig.borderRadius))
                        .padding(.all,4)
                }else{
                    self.calmoButtonConfig
                        .buttonContent
                        .frame(width: calmoButtonConfig.buttonWidth,height: calmoButtonConfig.buttonHeigth)
                        .background(theme.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: calmoButtonConfig.borderRadius))
                        .padding(.all,4)
                }

            }else {
                self.calmoButtonConfig
                    .buttonContent
            }
        }
        
    }
}

#Preview {
    CalmoButton(calmoButtonConfig: .init(buttonContent: {
        HStack(content: {
            Text("HI THERE")
        }).padding(.all)
    },withColor: true, onTap: {
        print("CLICK ME...")
        
    }))
}
