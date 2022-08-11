//
//  LoadingView.swift
//  Travel
//
//  Created by Burak Fidan on 11.08.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7).ignoresSafeArea(.all)
            VStack(spacing: 12) {
                ProgressView()
                    .padding(.vertical, 12)
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                Text("Loading...")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .background(RoundedRectangle(cornerRadius: 12).fill(.gray))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
