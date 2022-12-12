//
//  ContentView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct BGSettingContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 25) {
                ColorRectangleView(
                    color: Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
                ColorSliderView(value: $redSliderValue, tintColor: .red)
                ColorSliderView(value: $greenSliderValue, tintColor: .green)
                ColorSliderView(value: $blueSliderValue, tintColor: .blue)
                
                Spacer()
            
            }
            .padding()
        }
    }
}

//struct ColorSliderView: View {
//    @Binding var value: Double
//    let tintColor: Color
//
//    var body: some View {
//        HStack {
//            Text("\(lround(value))")
//                .foregroundColor(.white)
//                .frame(width: 35)
//            Slider(value: $value, in: 0...255, step: 1)
//                .tint(tintColor)
//            TextField("255", text: .constant("\(lround(value))"))
//                .textFieldStyle(.roundedBorder)
//                .frame(width: 50)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BGSettingContentView()
    }
}
