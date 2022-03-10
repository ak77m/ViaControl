//
//  Host.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import Foundation

struct Host: Codable, Hashable {
    //var id = UUID()
    var hostName : String
    var hostAddress : String
    var login: String
    var password: String
    var macAddress: String?
}
