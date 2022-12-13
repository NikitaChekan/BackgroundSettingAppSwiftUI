//
//  ContentView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct BGSettingContentView: View {
    @State private var redSliderValue = Double(Int.random(in: 0...255))
    @State private var greenSliderValue = Double(Int.random(in: 0...255))
    @State private var blueSliderValue = Double(Int.random(in: 0...255))
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BGSettingContentView()
    }
}
