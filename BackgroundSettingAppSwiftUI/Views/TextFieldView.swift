//
//  TextFieldView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    @Binding var text: String
    
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $text) { checkTextFieldValue() }
            .frame(width: 50)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                Text("Enter value from 0 to 255!")
            }
    }
    
    private func checkTextFieldValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
        } else {
            alertPresented.toggle()
            value = 0
            text = "0"
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(0), text: .constant("0"))
    }
}
