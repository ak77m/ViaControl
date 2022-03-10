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
           UITabBar.appearance().unselectedItemTintColor = UIColor.white
        }
    
    @EnvironmentObject var info : InfoManager
    
    
    @State private var selection = 0
    
    var body: some View {
        ZStack {
                TabView(selection: $selection){
                    Info()
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("Info")
                        }
                    Get()
                        .tabItem {
                            Image(systemName: "square.and.arrow.down.on.square")
                            Text("Сontrol")
                        }
                    Spacer ()
                   
                    Set()
                        .tabItem {
                            Image(systemName: "square.and.arrow.up")
                            Text("Set")
                        }
                    Setup()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Setup")
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationViewStyle(StackNavigationViewStyle())
            
            VStack {
                Spacer()
                   Image(systemName: "point.3.connected.trianglepath.dotted")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding()
                        .background(Circle().fill(.gray))
                        .overlay(Circle()
                                    .stroke(.foreground, lineWidth: 4))
                        .foregroundColor(info.isLogged ? .green : .white)
                        .onTapGesture {
                            info.login()
                        }
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
