//
//  ColorSliderView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 12.12.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var textFieldValue: String
    
    @State private var alertPresented = false
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.gray)
                .frame(width: 35)
                .lineLimit(1)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
            TextField("", text: $textFieldValue) { checkTextFieldValue() }
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.center)
            
                .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                    Text("Enter value from 0 to 255!")
                }
        }
    }
    
    private func checkTextFieldValue() {
        if let value = Int(textFieldValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        alertPresented.toggle()
        value = 0
        textFieldValue = ""
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(50), textFieldValue: .constant("0"), tintColor: .red)
    }
}
