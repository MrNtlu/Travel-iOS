//
//  CustomTabBar.swift
//  Travel
//
//  Created by Burak Fidan on 12.08.2022.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        HStack {
            TabBarButton(image: "house", index: 0, selectedTabIndex: $selectedTabIndex)
            
            TabBarButton(image: "mappin", index: 1, selectedTabIndex: $selectedTabIndex)
            
            TabBarButton(image: "gearshape", index: 2, selectedTabIndex: $selectedTabIndex)
        }
        .background(Color("Teal"))
        .frame(maxWidth: .infinity)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro Max")
            ContentView()
                .previewDevice("iPhone SE (3rd generation)")
            CustomTabBar(selectedTabIndex: .constant(0))
        }
    }
}

struct TabBarButton: View {
    
    var image: String
    var index: Int
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                withAnimation {
                    selectedTabIndex = index
                }
            }, label: {
                if index == 1 {
                    ZStack {
                        Circle()
                            .foregroundColor(selectedTabIndex == 1 ? Color("Orange") : Color("Blue"))
                            .frame(width: 64, height: 64)
                            .shadow(radius: 4)
                        
                        Image(systemName: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)

                    }
                    .offset(y: selectedTabIndex == 1 ? -6 : -32)
                } else {
                    Image(systemName: "\(image)\(selectedTabIndex == index ? ".fill" : "")")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .offset(y: selectedTabIndex == index ? -10 : 0)
                }
                
            })
            
            Spacer()
        }
    }
}
