//
//  ButtonView.swift
//  Travel
//
//  Created by Burak Fidan on 10.08.2022.
//

import SwiftUI

struct FilledButtonView: View {
    
    let action: () -> Void
    let buttonText: String
    let color: Color
    let textColor: Color = .white
    let textSize: CGFloat = 18
    let cornerRadius: CGFloat = 8
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 47)
                .background(color)
                .foregroundColor(textColor)
                .font(.system(size: textSize, weight: .medium))
                .cornerRadius(cornerRadius)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilledButtonView(action: {}, buttonText: "Button", color: Color("Teal"))
    }
}
