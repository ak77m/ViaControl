//
//  AddNewHost.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct AddNewHost: View {
    
    @Environment(\.presentationMode) var presentationMode //
    @EnvironmentObject var info : InfoManager
    
    
    var body: some View {
        VStack(spacing: 15.0){
            VStack(spacing: 15.0) {
                EntryField(sfSymbolName: "doc", placeHolder: "Название комнаты", field: $info.name)
                EntryField(sfSymbolName: "link", placeHolder: "IP адрес", field: $info.link)
                EntryField(sfSymbolName: "person", placeHolder: "Логин", field: $info.login)
                EntryField(sfSymbolName: "key", placeHolder: "Пароль", field: $info.password)
            }
            .padding()
            
            HStack{
              //Exit
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Label("Назад", systemImage: "arrowshape.turn.up.backward")
                }
                .padding(10)
                .background(Capsule(style: .continuous).fill(Color.green))
                
                Spacer(minLength: 5)
                
              //Save&exit
                Button(action: {
                    info.addNewHost()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Label("Сохранить", systemImage: "square.and.arrow.down")
                }
                .padding(10)
                .background(Capsule(style: .continuous).fill(Color.green))
                .opacity(info.isAddHostComplete ? 1 : 0.6)
                .disabled(!info.isAddHostComplete)
                
                
            }.padding()
            
        }
    }
}

struct AddNewHost_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHost()
    }
}
