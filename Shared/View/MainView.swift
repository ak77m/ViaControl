//
//  MainView.swift
//  ViaControl
//
//  Created by ak77m on 07.03.2022.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    init(){
           Theme.navigationBarColors(background: .darkGray, titleColor: .white)
           UITabBar.appearance().backgroundColor = UIColor.darkGray
        }
    
    @StateObject var request = TelnetManager(host: "192.168.101.17", port: 9982)
    @State private var selection = 0
    let requestStr = "<P><UN>su</UN><Pwd>supass</Pwd><Cmd>Login</Cmd><P1></P1><P 2></P2><P3></P3><P4></P4><P5></P5><P6></P6><P7></P7><P8></P8><P9></P9> <P10></P10></P>"
    
    var body: some View {
        ZStack {
            NavigationView{
                TabView(selection: $selection){
                    Info()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("Info")
                        }
                    Get()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "square.and.arrow.down.on.square")
                            Text("Get")
                        }
                    Spacer ()
                   
                    Set()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "square.and.arrow.up")
                            Text("Set")
                        }
                    Setup()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Setup")
                        }
                }
                .background(Color.purple)
                .navigationBarTitle(request.host)
                .navigationBarTitleDisplayMode(.inline)
            }
            VStack {
                Spacer()
                // Connection button
                Button(action: { request.login() }) {
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding()
                        .overlay(Circle()
                                    .stroke(.foreground, lineWidth: 4))
                        .foregroundColor(.green)
                        
                }
            }
        }
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
