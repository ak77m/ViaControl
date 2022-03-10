//
//  Set.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct Set: View {
    @EnvironmentObject var info : InfoManager
    @State var cmd = ""
    @State var P1 = ""
    @State var P2 = ""
    @State var P3 = ""
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text(info.resultString)
                    .textSelection(.enabled)
                
                VStack(spacing: 15.0) {
                    EntryField(sfSymbolName: "pc", placeHolder: "Команда", field: $cmd)
                    EntryField(sfSymbolName: "keyboard", placeHolder: "Параметр Р1", field: $P1)
                    EntryField(sfSymbolName: "keyboard", placeHolder: "Параметр Р2", field: $P2)
                    EntryField(sfSymbolName: "keyboard", placeHolder: "Параметр Р3", field: $P3)
                }
                .padding()
                
                Button(action: {
                    let request = RequestString(login: info.activeHost.login,
                                                password: info.activeHost.password,
                                                cmd: cmd.trimmingCharacters(in: .whitespacesAndNewlines),
                                                P1: P1.trimmingCharacters(in: .whitespacesAndNewlines),
                                                P2: P2.trimmingCharacters(in: .whitespacesAndNewlines),
                                                P3: P3.trimmingCharacters(in: .whitespacesAndNewlines))
                    info.request(request)
                    
                }, label: {Text("Произвольная команда")})
                    .padding()
                    .overlay(Capsule(style: .continuous)
                                .stroke(.white, lineWidth: 1))
                    //.background(.overlay(.green))
            }
            .navigationBarTitle("Управление")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Set_Previews: PreviewProvider {
    static var previews: some View {
        Set()
    }
}
