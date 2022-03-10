//
//  HostsList.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct HostsList: View {
    @EnvironmentObject var info : InfoManager
    @State var selection : String?
    var body: some View {
    
//        Menu(content: {
//            ForEach(info.hosts,  id: \.self) { item in
//                VStack(alignment: .leading){
//                    Text(item.hostName).fontWeight(.bold)
//                    Text("\(item.hostAdress) пользователь: \(item.login)").font(.footnote)
//                }
//                .onTapGesture { selectItem(item) }
//            }
//            .onDelete(perform: deleteHost)
//        }, label: {
//            Text(" q ")
//        })
        ForEach(info.hosts,  id: \.self) { item in
                VStack(alignment: .leading){
                    Text(item.hostName).fontWeight(.bold)
                    Text("\(item.hostAddress) пользователь: \(item.login)").font(.footnote)
                }
                .onTapGesture { selectItem(item) }
        }
        .onDelete(perform: deleteHost)
    }
    
    func deleteHost(at offsets: IndexSet) {
        info.hosts.remove(atOffsets: offsets)
        info.saveDefaults()
    }
        
    func selectItem(_ index: Host) {
        info.activeHost = index
    }
}

struct HostsList_Previews: PreviewProvider {
    static var previews: some View {
        HostsList()
    }
}
