//
//  Info.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct Info: View {
    @EnvironmentObject var info : InfoManager
    
    var body: some View {
       
        
        NavigationView{
            Form {
                Section("Подключение") {
                    Text("Комната : \(info.activeHost.hostName)")
                    Text("Адрес   : \(info.activeHost.hostAddress)")
                    Text("Логин   : \(info.activeHost.login)")
                    Text("Пароль  : \(info.activeHost.password)")
                    
                }
                
                Section("Статус устройства") {
                    Text("Соединение : \(info.isConnected ? "Успешно" : "Нет соединения" )")
                    Text("Авторизация: \(info.isLogged ? "Успешно" : "Нет соединения" )")
                }
                
                Section("Ответ") {
                    Text(info.loginString)
                    Text(info.resultString)
                }
                
                
            }
            
            
            .navigationBarTitle("Адрес \(info.activeHost.hostName)")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
