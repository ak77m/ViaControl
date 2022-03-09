//
//  ViaControlApp.swift
//  Shared
//
//  Created by ak77m on 07.03.2022.
//

import SwiftUI

@main
struct ViaControlApp: App {
    @StateObject var info = InfoManager()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(info)
        }
    }
}
