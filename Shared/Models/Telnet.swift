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
   
   
    func sendRequest(_ request: String) -> (success: Bool, response : String) {
        guard let client = client?.send(string: request) else {return (false, "Проверь строку подключения") }
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
