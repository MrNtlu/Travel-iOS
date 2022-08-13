//
//  ContentView.swift
//  Travel
//
//  Created by Burak Fidan on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTabIndex = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTabIndex {
                case 0:
                    HomeView()
                case 1:
                    MapView()
                default:
                    ScrollView {
                        Text("Tabbed")
                    }
                }
            }
            
            CustomTabBar(selectedTabIndex: $selectedTabIndex)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro Max")
            ContentView()
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
