//
//  ContentView.swift
//  Travel
//
//  Created by Burak Fidan on 8.08.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isSigningIn = false
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("login_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    .blur(radius: 2.2)
            }
            if !isSigningIn {
                VStack(spacing: 6) {
                    Text("Collect Moments Not Things")
                        .font(Font.custom("Pacifico-Regular", size: 46))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity)
                    
                    SignInButton {
                        self.isSigningIn = true
                    }
                    
                    Button("Don't have any account? Register") {
                        print("Clicked")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.all, 28)
            } else {
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            .foregroundColor(.black)
                        
                        TextField("Email", text: $emailTextField)
                            .keyboardType(.emailAddress)
                            .submitLabel(.next)
                            .font(.body)
                    }
                    .padding()
                    .background(Rectangle().fill(.white).cornerRadius(12))
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            .foregroundColor(.black)
                        
                        if showPassword {
                            TextField("Password", text: $passwordTextField)
                                .submitLabel(.done)
                                .font(.body)
                        } else {
                            SecureField("Password", text: $passwordTextField)
                                .submitLabel(.done)
                                .font(.body)
                        }
                        
                        Button(action: { self.showPassword.toggle()}) {
                            Image(systemName: self.showPassword ? "eye.slash.fill": "eye.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24,height: 24)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                    .padding()
                    .background(Rectangle().fill(.white).cornerRadius(12))
                    
                    SignInButton {
                        print("Signing in")
                    }
                }
                .padding(.all, 28)
            }
        }
    }
}

struct SignInButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Sign In")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color("Teal"))
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .semibold))
                .cornerRadius(16)
        }.padding(.top, 18)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
