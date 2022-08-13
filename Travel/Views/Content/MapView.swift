//
//  MapView.swift
//  Travel
//
//  Created by Burak Fidan on 12.08.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.482, longitude: -0.142), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    @State private var isPinSelected = false
    
    private let dumbData = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $region, annotationItems: dumbData) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack(spacing: 0) {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color("Teal"))
                                .cornerRadius(36)
                            
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color("Teal"))
                                .frame(width: 10, height: 10)
                                .rotationEffect(Angle(degrees: 180))
                                .offset(y: -3)
                        }
                        .onTapGesture {
                            self.isPinSelected.toggle()
                        }
                    }
                }
                
                .ignoresSafeArea(.all)
                .navigationTitle("Map")
                
                if isPinSelected {
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                        
                        Button {
                            withAnimation {
                                self.isPinSelected.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                        }
                        .offset(x: 6, y: -12)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        
                        VStack {
                            HStack {
                                Text("England")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                                    .font(.system(size: 18, weight: .bold))
                         

                            }
                            
                            Text("Lorem ipsum")
                        }
                        .padding(.all, 8)
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                }
            }
        }
        
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
