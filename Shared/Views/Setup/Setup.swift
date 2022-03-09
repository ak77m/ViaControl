//
//  Setup.swift
//  ViaControl
//
//  Created by ak77m on 07.03.2022.
//

import SwiftUI

struct Setup: View {
    
    @State var showModal = false
    @State var infoText = "Общие настройки"
    
    var body: some View {
        
        NavigationView{
            Form {
                Section("VIA устройства") {
                    HostsList()
                }
                
                Section("Общие настройки") {
                    Toggle(isOn: .constant(true),
                           label: { Text("Пример") })
                    Toggle(isOn: .constant(true),
                           label: { Text("Очистить список") })
                }
                
                Section("Статус подключения") {
                    
                }
                
            }
            .navigationBarItems(
                trailing:
                    
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                    })
            
            
            .navigationBarTitle(infoText)
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: self.$showModal) {
            AddNewHost()
        }
        
    }
    
    
    
}

struct Setup_Previews: PreviewProvider {
    static var previews: some View {
        Setup()
    }
}
