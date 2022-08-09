//
//  ContentView.swift
//  Travel
//
//  Created by Burak Fidan on 8.08.2022.
//

import SwiftUI

struct LoginView: View {
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
            VStack(spacing: 6) {
                Text("Collect Moments Not Things")
                    .font(Font.custom("Pacifico-Regular", size: 46))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
                
                Button("Sign in") {
                    print("Clicked")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .semibold))
                .cornerRadius(16)
                
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
            .padding(.bottom, 32)
            .padding(.horizontal, 16)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
