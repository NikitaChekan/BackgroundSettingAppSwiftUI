//
//  ColorSliderView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    @State private var alertPresented = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .foregroundColor(.gray)
                .frame(width: 35)
                .lineLimit(1)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = newValue.formatted()
                }
            TextFieldView(value: $value, text: $text, action: checkTextFieldValue)
                .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                    Text("Enter value from 0 to 255!")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
    
    private func checkTextFieldValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
            alertPresented.toggle()
            value = 0
            text = "0"
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(50), color: .red)
    }
}
