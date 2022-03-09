//
//  Get.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct Get: View {
    @ObservedObject var request : TelnetManager
    
    var body: some View {
        NavigationView{
            VStack(spacing: 8.0) {
                Button(action: {
                    request.request("<P><UN>su</UN><Pwd></Pwd><Cmd>IpInfo</Cmd><P1></P1><P2></P2><P3></P3 ><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9><P10></P10></P>")
                    
                }, label: {Text("Send command")})
                Text("Get")
            }
            .navigationBarTitle("Ощие настройки")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Get_Previews: PreviewProvider {
    static var previews: some View {
        Get(request: TelnetManager())
    }
}
