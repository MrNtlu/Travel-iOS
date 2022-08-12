//
//  TravelApp.swift
//  Travel
//
//  Created by Burak Fidan on 8.08.2022.
//

import SwiftUI

@main
struct TravelApp: App {
    
    @StateObject private var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            switch(authentication.status) {
            case .Error, .NotAuthenticated:
                LoginView().preferredColorScheme(.light).environmentObject(authentication)
            case .Authenticated:
                ContentView().preferredColorScheme(.light)
            }
        }
    }
}
