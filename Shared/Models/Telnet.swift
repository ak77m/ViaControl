//
//  Telnet.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import Foundation
import SwiftSocket

final class Telnet {
    public static let shared = Telnet()
    var client: TCPClient?
    
    
    
  // First connection  
    func loginRequest(host: String) -> (success: Bool, response : String) {
        
        self.client = TCPClient(address: host, port: Int32(9982))
        guard let client = self.client else { return (false, "Ошибка создания TCPClient") }

        switch client.connect(timeout: 10) {
                case .success:
                return (true, "Успешно")
                case .failure(let error):
                    return (false, "Что то не то \(error.localizedDescription)")
            }
        }
    //func sendRequest(_ request: String) -> (success: Bool, response : String)
    func sendRequest(_ data: RequestString) -> (success: Bool, response : String) {
        
        let connectionString  = "<P><UN>\(data.login)</UN><Pwd>\(data.password)</Pwd><Cmd>\(data.cmd)</Cmd><P1>\(data.P1)</P1><P 2>\(data.P2)</P2><P3>\(data.P3)</P3><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9><P10></P10></P>"
        
        guard let client = client?.send(string: connectionString) else {return (false, "Проверь строку подключения") }
            switch client {
                case .success:
                    guard let text = readResponse() else {
                        return (false, "Запрос состоялся, но вернул nil") }
                    return (true, text)
                case .failure(let error):
                    return (false, "Что то не то \(error.localizedDescription)")
            }
    }
    
    func closeConnection() {
        client?.close()
    }
     
    
    private func readResponse() -> String? {
        guard let response = client?.read(1024*10, timeout: 10) else { return nil }
        return String(bytes: response, encoding: .utf8)
    }
    
    deinit {
          client?.close()
          print("Connection has been closed")
      }
    
    
    
}
