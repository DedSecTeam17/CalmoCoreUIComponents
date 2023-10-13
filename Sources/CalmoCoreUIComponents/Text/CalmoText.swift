//
//  SwiftUIView.swift
//  
//
//  Created by Mohammed Elamin on 13/10/2023.
//

import SwiftUI


public class CalmoTextViewModel : ObservableObject {
    
    @Published var text:String
    @Published var varient : CalmoFontVarient
    
    public  init(text: String, varient: CalmoFontVarient) {
        self.text = text
        self.varient  = varient
    }

}

public struct CalmoText: View {
//    let packageBundle = Bundle.module // "module" is auto-generated for Swift packages with resources
    
    
    @ObservedObject  var viewModel : CalmoTextViewModel
    public init(viewModel: CalmoTextViewModel) {
        self.viewModel = viewModel
    }

    
    public var body: some View {
        Text(viewModel.text)
            .font(viewModel.varient.front)
    }
}

#Preview {
    CalmoText(viewModel: .init(text: "Hello There", varient: .largeTitle))
}
