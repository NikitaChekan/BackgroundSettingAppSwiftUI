//
//  ColorRectangleView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct ColorRectangleView: View {
    let color: Color
    let cornerRadius: CGFloat = 25

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(height: 200)
            .foregroundColor(color)
            .overlay(
                RoundedRectangle(
                    cornerRadius: cornerRadius
                )
                .stroke(.white, lineWidth: 2)
            )
            .shadow(radius: 15)
    }
}

struct ColorRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorRectangleView(color: .black)
    }
}
