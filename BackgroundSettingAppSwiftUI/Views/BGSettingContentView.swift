//
//  ContentView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct BGSettingContentView: View {
    @FocusState private var isInputActive: Bool
    
    @State private var redSliderValue = Double(Int.random(in: 0...255))
    @State private var greenSliderValue = Double(Int.random(in: 0...255))
    @State private var blueSliderValue = Double(Int.random(in: 0...255))
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 25) {
                ColorRectangleView(
                    redColor: redSliderValue,
                    greenColor: greenSliderValue,
                    blueColor: blueSliderValue
                )
                ColorSliderView(value: $redSliderValue, textFieldValue: .constant("\(redSliderValue)"), tintColor: .red)
                ColorSliderView(value: $greenSliderValue, textFieldValue: .constant("\(greenSliderValue)"), tintColor: .green)
                ColorSliderView(value: $blueSliderValue, textFieldValue: .constant("\(blueSliderValue)"), tintColor: .blue)
                
                
                Spacer()
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
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BGSettingContentView()
    }
}
