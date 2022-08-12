//
//  Authentication.swift
//  Travel
//
//  Created by Burak Fidan on 12.08.2022.
//

import Foundation
import SwiftUI

class Authentication: ObservableObject {
    @Published var status: AuthenticationStatus = .NotAuthenticated
    
    func updateAuthentication(status: AuthenticationStatus){
        withAnimation {
            self.status = status
        }
    }
}

enum AuthenticationStatus {
    case NotAuthenticated
    case Authenticated
    case Error
}

enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password are incorrect. Please try again", comment: "")
            }
        }
    }
