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
           UITabBar.appearance().barTintColor = UIColor.green
           UITabBar.appearance().unselectedItemTintColor = UIColor.white
           UITabBar.appearance().tintColor = UIColor.green
        }
    
    @EnvironmentObject var info : InfoManager
    @StateObject var request = TelnetManager()
    
    
    @State private var selection = 0
    
    var body: some View {
        ZStack {
                TabView(selection: $selection){
                    Info(request: request)
                        .tag(0)
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("Info")
                        }
                    Get(request: request)
                        .tag(1)
                        .tabItem {
                            Image(systemName: "square.and.arrow.down.on.square")
                            Text("Get")
                        }
                    Spacer ()
                   
                    Set()
                        .tag(2)
                        .tabItem {
                            Image(systemName: "square.and.arrow.up")
                            Text("Set")
                        }
                    Setup()
                        .tag(3)
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Setup")
                        }
                }
                
                .navigationBarTitleDisplayMode(.inline)
                //.accentColor(.green)
                .navigationViewStyle(StackNavigationViewStyle())
            
            VStack {
                Spacer()
                // Connection button
//                Button(action: {
//                    request.connectTo = info.activeHost
//                    request.login()
     //           }) {
                   Image(systemName: "point.3.connected.trianglepath.dotted")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding()
                        .background(Circle().fill(.gray))
                        .overlay(Circle()
                                    .stroke(.foreground, lineWidth: 4))
                        .foregroundColor(request.isLogged ? .green : .white)
                        .onTapGesture {
                            request.connectTo = info.activeHost
                            request.login()
                        }
             //   }
                
            }
        }
        //.foregroundColor(.white)
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
