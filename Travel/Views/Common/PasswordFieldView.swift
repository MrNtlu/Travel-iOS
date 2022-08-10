//
//  PasswordFieldView.swift
//  Travel
//
//  Created by Burak Fidan on 10.08.2022.
//

import SwiftUI

struct PasswordFieldView: View {
    
    @State private var showPassword = false
    var textfieldBinding: Binding<String>
    
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20,height: 20)
                .foregroundColor(.black)
            
            if showPassword {
                TextField("Password", text: textfieldBinding)
                    .submitLabel(.done)
                    .font(.body)
                    .foregroundColor(.black)
                    .placeholder(when: textfieldBinding.wrappedValue.isEmpty) {
                        Text("Password").foregroundColor(.gray)
                    }
            } else {
                SecureField("Password", text: textfieldBinding)
                    .submitLabel(.done)
                    .font(.body)
                    .foregroundColor(.black)
                    .placeholder(when: textfieldBinding.wrappedValue.isEmpty) {
                        Text("Password").foregroundColor(.gray)
                    }
            }
            
            Button(action: { self.showPassword.toggle()}) {
                Image(systemName: self.showPassword ? "eye.slash.fill": "eye.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.secondary)
                
            }
        }
        .padding()
        .background(Rectangle().fill(.white).cornerRadius(12))
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(textfieldBinding: .constant(""))
    }
}
