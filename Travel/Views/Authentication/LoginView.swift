//
//  ContentView.swift
//  Travel
//
//  Created by Burak Fidan on 8.08.2022.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @State private var isSigningIn = false
    @State private var isRegisterSheetVisible = false
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    Image("login_bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        .blur(radius: 3)
                }
                if !isSigningIn {
                    VStack(spacing: 6) {
                        Text("Collect Moments Not Things")
                            .font(Font.custom("Pacifico-Regular", size: 46))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(maxHeight: .infinity)
                        
                        FilledButtonView(action: {
                            self.isSigningIn.toggle()
                        }, buttonText: "Sign in", color: Color("Teal")).padding(.top, 18)
                        
                        NavigationLink(destination: RegisterView(false)) {
                            Text("Don't have any account? Register")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.all, 28)
                } else {
                    VStack(spacing: 8) {
                        TextFieldView(
                            imageSystemName: "envelope.fill", imageSize: 20, textfieldPlaceholder: "Email",
                            textfieldBinding: $emailTextField, keyboardType: .emailAddress
                        )
                        
                        PasswordFieldView(textfieldBinding: $passwordTextField)
                        
                        FilledButtonView(action: {
                            print("Signing in")
                        }, buttonText: "Sign in", color: Color("Teal")).padding(.top, 18)
                        
                        Button {
                            print("Forgot password")
                        } label: {
                            Text("Forgot Password?")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical, 6)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        
                        LabelDivider(label: "OR", color: .black).padding(.vertical, 22)
                        
                        SignInWithAppleButton(.signIn) { request in
                            request.requestedScopes = [.email, .fullName]
                        } onCompletion: { result in
                            switch result {
                            case .success(let authResults):
                                print("Auth Success \(authResults)")
                            case .failure(let error) :
                                print("Auth failed \(error)")
                            }
                        }
                        .signInWithAppleButtonStyle(.black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 47)
                        .cornerRadius(12)
                        .padding(.vertical, 12)
                        
                        GoogleSignInButton{
                            print("Google Sign in pressed")
                        }
                        
                        Button {
                            self.isRegisterSheetVisible.toggle()
                        } label: {
                            Text("Don't have any account? Register")
                        }
                        .padding(.vertical, 24)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .sheet(isPresented: $isRegisterSheetVisible) {
                            RegisterView()
                        }
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.all, 28)
                    .ignoresSafeArea(.keyboard)
                }
            }
            .navigationTitle(isSigningIn ? "Login" : "Getting Started")
            .navigationBarHidden(!isSigningIn)
        }
    }
}

struct GoogleSignInButton: View {
    
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Image("google")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundColor(.black)
            
            Text("Sign in with Google")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 47)
        .background(Rectangle().fill(.white).cornerRadius(12))
        .onTapGesture {
            action()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 13 Pro Max")
            LoginView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13 mini")
        }
    }
}
