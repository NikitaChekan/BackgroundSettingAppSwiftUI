//
//  TextFieldView.swift
//  BackgroundSettingAppSwiftUI
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    @Binding var textFieldValue: String
    
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $textFieldValue) { checkTextFieldValue() }
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .multilineTextAlignment(.center)
        
            .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                Text("Enter value from 0 to 255!")
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

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(0), textFieldValue: .constant("0"))
    }
}
