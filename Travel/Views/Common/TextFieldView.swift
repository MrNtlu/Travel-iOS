//
//  TextFieldView.swift
//  Travel
//
//  Created by Burak Fidan on 10.08.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    var imageSystemName: String?
    let imageSize: CGFloat
    let textfieldPlaceholder: String
    var textfieldBinding: Binding<String>
    let keyboardType: UIKeyboardType
    let submitLabel: SubmitLabel = .next
    
    var body: some View {
        HStack {
            if imageSystemName != nil {
                Image(systemName: imageSystemName!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(.black)
            }
            
            
            TextField("", text: textfieldBinding)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
                .font(.body)
                .foregroundColor(.black)
                .placeholder(when: textfieldBinding.wrappedValue.isEmpty) {
                    Text(textfieldPlaceholder).foregroundColor(.gray)
                }
        }
        .padding()
        .background(Rectangle().fill(.white).cornerRadius(12))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(imageSystemName: "envelope.fill", imageSize: 20, textfieldPlaceholder: "Email", textfieldBinding: .constant(""), keyboardType: .emailAddress)
    }
}
