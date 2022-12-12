//
//  ContentView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct BackgroundSettingContentView: View {
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
                        red: redSliderValue,
                        green: greenSliderValue,
                        blue: blueSliderValue
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

//struct ColorRectangleView: View {
//    @Binding var color: Color
//    let cornerRadius: CGFloat = 25
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: cornerRadius)
//            .frame(height: 200)
//            .foregroundColor(color)
//            .overlay(
//                RoundedRectangle(
//                    cornerRadius: cornerRadius
//                )
//                .stroke(.white, lineWidth: 2)
//            )
//            .shadow(radius: 15)
//    }
//}

struct ColorSliderView: View {
    @Binding var value: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .frame(width: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
            TextField("255", text: .constant("\(lround(value))"))
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
        }
    }
}

//struct BorderedViewModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//            .overlay(
//                RoundedRectangle(cornerRadius: 4)
//                    .stroke(lineWidth: 1)
//                    .foregroundColor(.blue)
//            )
//            .shadow(color: .gray.opacity(0.4), radius: 3, x: 1, y: 2)
//    }
//}
//
//extension TextField {
//    func bordered() -> some View {
//        modifier(BorderedViewModifier())
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSettingContentView()
    }
}
