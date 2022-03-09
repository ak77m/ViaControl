//
//  EntryField.swift
//  MyСonfidentialInfo
//
//  Created by ak77m on 25.02.2021.
//  Original idea by Stewart Lynch on 2020-05-08.

import SwiftUI

// Кастомная строка ввода
// Модификаторы добавленны отдельно в файле Extensions

struct EntryField: View {
    var sfSymbolName: String
    var placeHolder: String
    @Binding var field: String
    var isSecure:Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(.gray, lineWidth: 1))
            
        }
    }
}
