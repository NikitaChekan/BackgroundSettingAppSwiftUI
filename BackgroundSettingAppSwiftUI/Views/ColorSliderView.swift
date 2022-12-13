//
//  ColorSliderView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.gray)
                .frame(width: 35)
                .lineLimit(1)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
            TextField("", value: $value, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(50), tintColor: .red)
    }
}
