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
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .onTapGesture { /// В конспект
                    isInputActive = false
                }
            VStack(spacing: 25) {
                ColorRectangleView(
                    redColor: redSliderValue,
                    greenColor: greenSliderValue,
                    blueColor: blueSliderValue
                )
                VStack {
                    ColorSliderView(value: $redSliderValue, tintColor: .red)
                    ColorSliderView(value: $greenSliderValue, tintColor: .green)
                    ColorSliderView(value: $blueSliderValue, tintColor: .blue)
                }
                .focused($isInputActive)
                .keyboardType(.decimalPad)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
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
