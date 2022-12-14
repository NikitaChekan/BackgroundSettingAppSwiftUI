//
//  ContentView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct BGSettingContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .onTapGesture {
                    isInputActive = false
                }
            VStack(spacing: 25) {
                ColorRectangleView(
                    redColor: redSliderValue,
                    greenColor: greenSliderValue,
                    blueColor: blueSliderValue
                )
                VStack {
                    ColorSliderView(value: $redSliderValue, color: .red)
                    ColorSliderView(value: $greenSliderValue, color: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
                }
                .focused($isInputActive)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Spacer()
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
