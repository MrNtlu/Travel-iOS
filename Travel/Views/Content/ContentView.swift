//
//  ContentView.swift
//  Travel
//
//  Created by Burak Fidan on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            TabView {
                Text("The content of the first view")
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("First Tab")
                      }
                   Text("The content of the second view")
                     .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Second Tab")
                      }
            }
            .navigationTitle("Welcome")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
