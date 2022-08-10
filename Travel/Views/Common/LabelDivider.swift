//
//  LabelDivider.swift
//  Travel
//
//  Created by Burak Fidan on 10.08.2022.
//

import SwiftUI
import Foundation

struct LabelDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            customDivider
            Text(label).fontWeight(.bold).foregroundColor(color)
            customDivider
        }
    }

    var customDivider: some View {
        Rectangle().fill(color).frame(height: 2).cornerRadius(12)
    }
}
