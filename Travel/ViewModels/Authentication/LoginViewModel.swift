//
//  LoginViewModel.swift
//  Travel
//
//  Created by Burak Fidan on 12.08.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var error: AuthenticationError?
    
    func signIn(completion: @escaping (Bool) -> Void) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(true)
//            self.error = .invalidCredentials
//            self.isLoading = false
        }
    }
}
