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
    
    private let savedHosts = UserDefaults.standard.getStructArray(Host.self, forKey: "hostsList")
    
    init() {
        hosts = savedHosts
        activeHost = Host(hostName: "", hostAdress: "", login: "", password: "", isActive: true)
    }
    
    func addNewHost() {
        hosts.append(Host(hostName: name,
                          hostAdress: link,
                          login: login,
                          password: password,
                          isActive: false))
        saveDefaults()
        name = ""
        link = ""
        login = ""
        password = ""
    }
    
    func saveDefaults() {
        UserDefaults.standard.setStructArray(hosts, forKey: "hostsList")
    }
    
    // MARK: - New host fields validation
    // Проверяем корректность введенных данных нового хоста view AddNewHost
    
    @Published var name = ""
    @Published var link = ""
    @Published var login = ""
    @Published var password = ""
    
    // Check all new host fields
    var isAddHostComplete: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
           login.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
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
