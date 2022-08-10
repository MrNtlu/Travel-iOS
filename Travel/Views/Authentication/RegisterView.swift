//
//  RegisterView.swift
//  Travel
//
//  Created by Burak Fidan on 10.08.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var shouldShowNavigation: Bool
    
    init(_ shouldShowNavigation: Bool = true) {
        self.shouldShowNavigation = shouldShowNavigation
    }
    
    @State private var firstNameTextField = ""
    @State private var lastNameTextField = ""
    @State private var usernameTextField = ""
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var rePasswordTextField = ""
    @State private var showPassword = false
    
    private func setNavigationTitleColor(color: UIColor) {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: color]
        navBarAppearance.titleTextAttributes = [.foregroundColor: color]
    }
    
    var body: some View {
        if shouldShowNavigation {
            NavigationView {
                content
            }.onAppear {
                setNavigationTitleColor(color: .white)
            }.onDisappear {
                setNavigationTitleColor(color: .black)
            }
        } else {
            content.onAppear {
                setNavigationTitleColor(color: .white)
            }.onDisappear {
                setNavigationTitleColor(color: .black)
            }
        }
    }
    
    var content: some View {
        ZStack(alignment: .topTrailing) {
            GeometryReader { geometry in
                Image("register_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    .blur(radius: 3)
            }
            
            VStack {
                HStack {
                    TextFieldView(imageSystemName: "person.fill", imageSize: 20, textfieldPlaceholder: "First Name", textfieldBinding: $firstNameTextField, keyboardType: .default)
                    
                    TextFieldView(imageSize: 20, textfieldPlaceholder: "Last Name", textfieldBinding: $lastNameTextField, keyboardType: .default)
                }
                
                TextFieldView(
                    imageSystemName: "person.text.rectangle", imageSize: 20, textfieldPlaceholder: "Username",
                    textfieldBinding: $usernameTextField, keyboardType: .default
                )
                
                TextFieldView(
                    imageSystemName: "envelope.fill", imageSize: 20, textfieldPlaceholder: "Email",
                    textfieldBinding: $emailTextField, keyboardType: .emailAddress
                )
                
                PasswordFieldView(textfieldBinding: $passwordTextField)
                
                HStack (spacing: 8) {
                    
                    FilledButtonView(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, buttonText: "Cancel", color: .gray)
                    
                    FilledButtonView(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, buttonText: "Register", color: .blue)
                }
                .padding(.top, 36)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.all, 28)
        }
        .navigationTitle("Register")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
