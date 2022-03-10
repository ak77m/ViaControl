////
////  TelnetManager.swift
////  ViaControl
////
////  Created by ak77m on 07.03.2022.
////
//
//import SwiftUI
//
//
//class XXXXzzzzzXXX: ObservableObject {
//    @Published var connectTo = Host(hostName: "", hostAddress: "", login: "", password: "")
//    
//     @Published var isConnected = false
//     @Published var isLogged  = false
//    
//     @Published var loginString : String = "Логин"
//     @Published var resultString : String = "Ответ"
//     
//    let connectionString  = "<P><UN>su</UN><Pwd>supass</Pwd><Cmd>Login</Cmd><P1></P1><P 2></P2><P3></P3><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9> <P10></P10></P>"
//    
//    init() {
//    }
//  
//    
//    func login() {
//        
//        //close before open
//        if isLogged {
//            Telnet.shared.closeConnection()
//            isConnected  = false
//            isLogged = false
//            print("Close connection")
//        } else {
//            print("Open connection")
//            let login = Telnet.shared.loginRequest(host: connectTo.hostAddress)
//            isConnected = login.success
//            loginString = login.response
//            
//            if isConnected {
//                // Для первого логина нужно два раза подать запрос. Хз почему
//                _ = Telnet.shared.sendRequest(connectionString)
//                let result = Telnet.shared.sendRequest(connectionString)
//                isLogged = result.success
//                resultString = result.response
//                
//            }
//        }
//    }
//    
//    func request(_ text: String) {
//        let result = Telnet.shared.sendRequest(text)
//        resultString = result.response
//    }
//}
