//
//  Get.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct Get: View {
    @EnvironmentObject var info : InfoManager
    @State var macAddress : String = ""
    @State var wolIs = false
    
    
    var body: some View {
        NavigationView{
            
            Form {
                Section("Управление питанием \(info.activeHost.hostName)") {
                    Toggle("Послать команду WOL", isOn: $wolIs)
                    Toggle("Перезапустить", isOn: $wolIs)
                    Toggle("Выключить", isOn: $wolIs)
                    
                    //                    Text("Комната : \(info.activeHost.hostName)")
                    //                    Text("Адрес   : \(info.activeHost.hostAddress)")
                    //                    Text("Логин   : \(info.activeHost.login)")
                    //                    Text("Пароль  : \(info.activeHost.password)")
                    
                }.toggleStyle(.switch)
                
                //                VStack(alignment: .center, spacing: 8.0) {
                //                    Button(action: {
                //                        //                    info.request("<P><UN>su</UN><Pwd></Pwd><Cmd>PowerOff</Cmd><P1></P1><P2></P2><P3>< /P3><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9><P10></P10></P>")
                //
                //                    }, label: {Text("Power OFF")})
                //
                //                    Button(action: {
                //                        _ = Wol.send.toTarget(MAC: macAddress)
                //
                //                    }, label: {Text("Power On WOL")})
                //
                //                    TextField("MAC address", text: $macAddress)
            }
            .padding()
            .navigationBarTitle("Ощие настройки")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Get_Previews: PreviewProvider {
    static var previews: some View {
        Get()
    }
}
