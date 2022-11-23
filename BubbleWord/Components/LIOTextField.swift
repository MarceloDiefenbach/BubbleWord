//
//  LIOTextField.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

enum TextFieldType {
    case name, roomCode;
}

struct LIOTextField: View {
    
    @State var placeholder: String
    @Binding var textField: String
    @State var textFieldType: TextFieldType
//    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        HStack {
                TextField("", text: self.$textField)
//                    .focused($keyboardFocused)
                    .font(.system(size: FontSize.small.value, weight: .bold))
                    .foregroundColor(.white)
                    .disableAutocorrection(true)
                    .textContentType(.username)
                    .multilineTextAlignment(.center)
                    .placeholder(when: textField.isEmpty) {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(.system(size: FontSize.small.value, weight: .regular))
                            .multilineTextAlignment(.center)
                    }
                    .keyboardType(UIKeyboardType.default)
                    .autocapitalization(.none)
                    .padding(.vertical, Spacing.xxxs.value)
                    .onChange(of: textField) { newValue in
                        if textFieldType == .name {
                            UserDefaults.standard.set(newValue, forKey: "username")
                        }
                    }
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//                            keyboardFocused = true
                        })
                    }
        }
        .overlay(
            RoundedRectangle(cornerRadius: CornerRadius.small.value)
                .stroke(.white, lineWidth: 1)
        )
    }
}

struct LIOTextField_Previews: PreviewProvider {
    static var previews: some View {
        LIOTextField(placeholder: "Placeholder", textField: .constant(""), textFieldType: .name)
    }
}
