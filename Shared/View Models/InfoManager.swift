//
//  InfoManager.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import Combine
import SwiftUI

class InfoManager: ObservableObject {
    @Published var hosts = [Host]()
    @Published var activeHost : Host
    
    private let savedHosts = UserDefaults.standard.getStructArray(Host.self, forKey: "savedList")
    
    init() {
        hosts = savedHosts
        activeHost = Host(hostName: "", hostAddress: "", login: "", password: "")
    }
    
    func addNewHost() {
        hosts.append(Host(hostName: name,
                          hostAddress: link,
                          login: loginName,
                          password: password))
        saveDefaults()
        name = ""
        link = ""
        loginName = ""
        password = ""
    }
    
    func saveDefaults() {
        UserDefaults.standard.setStructArray(hosts, forKey: "savedList")
    }
    
    // MARK: - Telnet
    //@Published var connectTo = Host(hostName: "", hostAdress: "", login: "", password: "", isActive: true)
    
     @Published var isConnected = false
     @Published var isLogged  = false
    
     @Published var loginString : String = "Логин"
     @Published var resultString : String = "Ответ"
     
    func login() {
        let loginString = RequestString(login: activeHost.login,
                                        password: activeHost.password,
                                        cmd: "Login",
                                        P1: "",
                                        P2: "",
                                        P3: "")
        
        //close before open
        if isLogged {
            Telnet.shared.closeConnection()
            isConnected  = false
            isLogged = false
            print("Close connection")
            
        } else {
            print("Open connection")
            
            if checkConnection() {
                // Для первого логина нужно два раза подать запрос. Хз почему
                _ = Telnet.shared.sendRequest(loginString)
                let result = Telnet.shared.sendRequest(loginString)
                isLogged = result.success
                resultString = result.response
                
            }
        }
    }
    
    // проверяем соединение перед каждой попыткой отправки команды
    func checkConnection() -> Bool {
        let login = Telnet.shared.loginRequest(host: activeHost.hostAddress)
        isConnected = login.success
        if !isConnected {
            isConnected = false
            resultString = "Соединение закрыто"
        }
        loginString = login.response
        return isConnected
    }
    
    func request(_ data: RequestString) {
        print(data)
       // if checkConnection() {
            _ = Telnet.shared.sendRequest(data)
            let result = Telnet.shared.sendRequest(data)
            resultString = result.response
       // }
    }
    
    // MARK: - New host fields validation
    // Проверяем корректность введенных данных нового хоста view AddNewHost
    
    @Published var name = ""
    @Published var link = ""
    @Published var loginName = ""
    @Published var password = ""
    
    // Check all new host fields
    var isAddHostComplete: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            loginName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
           password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
           !isLinkValid() {
            return false
        }
        return true
    }
    
    func isLinkValid() -> Bool {
        //let link = NSPredicate(
        return true
    }
    
    
    
}
