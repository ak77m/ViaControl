//
//  Set.swift
//  ViaControl
//
//  Created by ak77m on 08.03.2022.
//

import SwiftUI

struct Set: View {
    var body: some View {
        NavigationView{
            Text("Управление")
            .navigationBarTitle("Управление")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Set_Previews: PreviewProvider {
    static var previews: some View {
        Set()
    }
}
