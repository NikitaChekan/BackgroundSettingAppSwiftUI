//
//  ColorRectangleView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct ColorRectangleView: View {
    let redColor: Double
    let greenColor: Double
    let blueColor: Double

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 200)
            .foregroundColor(
                Color(
                    red: redColor / 255,
                    green: greenColor / 255,
                    blue: blueColor / 255
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                .stroke(.white, lineWidth: 2)
            )
//            .shadow(radius: 15)
    }
}

struct ColorRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorRectangleView(redColor: 0, greenColor: 0, blueColor: 0)
    }
}
