//
//  TelnetManager.swift
//  ViaControl
//
//  Created by ak77m on 07.03.2022.
//

import Foundation
import SwiftSocket

class TelnetManager: ObservableObject {
    
      let host: String
      let port : Int
      let client: TCPClient?
      let loginInfo  = "<P><UN>su</UN><Pwd>supass</Pwd><Cmd>Login</Cmd><P1></P1><P 2></P2><P3></P3><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9> <P10></P10></P>"
      var isConnected : Bool = false
      
    
     @Published var loginString : String = "Логин"
     @Published var resultString : String = "Ответ"
     
    
    init(host: String, port: Int) {
        self.host = host
        self.port = 9982
        self.client = TCPClient(address: host, port: Int32(port))
    }
  
     func login() {
        //close before open
        self.client?.close()
        
        switch client?.connect(timeout: 10) {
           case .success:
                loginString = "Все ок"
                //loginString = readResponse() ?? "пусто"
                return isConnected = true
           case .failure(let error):
                loginString = "Что то не то \(error.localizedDescription)"
                return isConnected = false
            case .none:
                loginString = "ничего не произошло"
                return isConnected = false
        }
    }
    
  func sendRequest(_ string: String) {

      guard isConnected, let client = client?.send(string: string) else {return resultString = "Проверь строку подключения" }
      
          switch client {
              case .success:
                  return resultString = readResponse()
              case .failure(let error):
                  print(error.localizedDescription)
                  return resultString = "Что то не то \(error.localizedDescription)"
          }
      
      
  }
      
      private func readResponse() -> String {
          guard let response = client?.read(1024*10, timeout: 10) else { return "---- Ошибка чтения -----" }
          return String(bytes: response, encoding: .utf8) ?? "Ничего не вернулось"
      }
    
    deinit {
        client?.close()
        print("!!!!!!!!!!!!!!!!!!")
    }
    
}
