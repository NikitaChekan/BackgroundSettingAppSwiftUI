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
    var action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 50)
        .textFieldStyle(.roundedBorder)
        .multilineTextAlignment(.center)
        .keyboardType(.decimalPad)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(0), text: .constant("0"), action: {})
    }
}
